#!/usr/bin/env python3
# vim: set ts=4 sts=0 sw=4 si fenc=utf-8 et:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2024, HRDAG, GPL v2 or later
# =========================================

# ---- dependencies {{{
from pathlib import Path
import pandas as pd
from pydantic import BaseModel, field_validator
#}}}

# --- support methods --- {{{
def cleanname(colname):
    form = colname.lower()
    swap = '.: '
    for char in swap: form = form.replace(char, '_')
    return form


class xlsx(BaseModel):
    filename: Path | str
    sheets: None | list
    sheet: None | str

    @field_validator('filename')
    def checkpath(cls, value):
        if not Path(value).exists():
            raise ValueError(f'Cannot find file with path {value}')
        return value

    def setsheets(self):
        known = pd.ExcelFile(self.filename).sheet_names
        if not len(known) >= 1:
            raise ValueError(f'Expected {self.filename} to have at least one read-able sheet of data.')
        if not self.sheets: self.sheets = known
        if sorted(known) != sorted(self.sheets):
            raise ValueError(f'Expected {self.filename} to have sheets {self.sheets} but found {known}.')
        return self

    def setsheet(self):
        if not self.sheet: self.sheet = self.sheets[0]
        if self.sheet not in self.sheets: raise ValueError(f'\
            {self.sheet} not found in {self.filename} with sheets {self.sheets}')
        return self

    def toframe(self):
        self.setsheets()
        self.setsheet()
        df = pd.read_excel(io=self.filename, sheet_name=self.sheet)
        df.rename(columns={c: cleanname(colname=c) for c in df.columns}, inplace=True)
        return df


def loadxl(xlfile, sheets=None, sheet=None):
    file = xlsx(filename=xlfile, sheets=sheets, sheet=sheet)
    df = file.toframe()
    return df
# }}}

# done.
