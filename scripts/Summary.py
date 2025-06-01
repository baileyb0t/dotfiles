#!/usr/bin/env python3
# vim: set ts=4 sts=0 sw=4 si fenc=utf-8 et:
# vim: set fdm=marker fmr={{{,}}} fdl=0 foldcolumn=4:
# Authors:     BP
# Maintainers: BP
# Copyright:   2025, HRDAG, GPL v2 or later
# =========================================

# ---- dependencies {{{
import pandas as pd
#}}}

# --- support methods --- {{{
class Summary():
    """
    Calculation:
    - Table: df[[INDICATOR_COL, GROUP_COL]].groupby(GROUP_COL)[INDICATOR_COL].sum()
    - Description: Summarize by {GROUP_COL} all records where {INDICATOR_COL} is True
    Present:
    - Count/Percent: '{GROUP_COL.sum()/INDICATOR_COL.sum()*100}% ({GROUP_COL.sum()} of {INDICATOR_COL.sum()})'
    - Finding:
        - Of the {INDICATOR_COL.sum()},
            - {magic['GROUP_COUNTS'][GROUP_LABEL]} were for {GROUP_LABEL}
            - (repeated for each group appearing in GROUP_COL)
    """

    def __init__(self, df, INDICATOR_COL, INDICATOR_DESC, INDICATOR_OP, GROUP_COL, GROUP_DESC):
        self.df = df
        assert (INDICATOR_COL in df.columns) & (df[INDICATOR_COL].dtype == bool)
        self.INDICATOR_COL = INDICATOR_COL
        self.INDICATOR_DESC = INDICATOR_DESC
        self.INDICATOR_OP = INDICATOR_OP
        assert GROUP_COL in df.columns
        self.GROUP_COL = GROUP_COL
        self.GROUP_DESC = GROUP_DESC
        self.magic = {}
        self.info = """"""


    def __setmagic__(self):
        magic = {
            'INDICATOR_COL': self.INDICATOR_COL,
            'INDICATOR_DESC': self.INDICATOR_DESC,
            'INDICATOR_OP': self.INDICATOR_OP,
            'GROUP_COL': self.GROUP_COL,
            'GROUP_DESC': self.GROUP_DESC,
        }
        df = self.df
        magic['INDICATOR_COUNT'] = df[self.INDICATOR_COL].sum()
        magic['GROUP_COUNTS'] = df[[self.INDICATOR_COL, self.GROUP_COL]
            ].groupby(self.GROUP_COL)[self.INDICATOR_COL].sum().to_dict()
        magic['GROUP_PERCENTS'] = (df[[self.INDICATOR_COL, self.GROUP_COL]
            ].groupby(self.GROUP_COL)[self.INDICATOR_COL].sum(
            )/magic['INDICATOR_COUNT']*100).to_dict()
        assert magic['INDICATOR_COUNT'] == sum(magic['GROUP_COUNTS'].values())
        self.magic = magic


    def __setinfo__(self):
        magic = self.magic
        info = f"""Of the {magic['INDICATOR_COUNT']} {magic['INDICATOR_DESC']},"""
        for GROUP_LABEL, GROUP_IND_SUM in magic['GROUP_COUNTS'].items():
            info += f"\n-  {GROUP_IND_SUM} or {magic['GROUP_PERCENTS'][GROUP_LABEL]:.1f}% {
            magic['INDICATOR_OP']} {magic['GROUP_DESC']} {GROUP_LABEL}."
        self.info = info


    def getinfo(self):
        if self.magic == {}: self.__setmagic__()
        if self.info == '': self.__setinfo__()
        return self.info


    def getmagic(self):
        if self.magic == {}: self.__setmagic__()
        return self.magic


    def __str__(self):
        return self.info


    def __repr__(self):
        return str(self.magic)


    def __dict__(self):
        return self.magic
# }}}

# done.
