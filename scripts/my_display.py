"Generic display methods for viewing or formatting data"

# dependencies
import pandas as pd

# support methods
def pretty_str(label, a, b=False, newline=False):
    "Return a formatted string containing label, a"
    if newline:
        if b:
            return "{:40}:{:10}{:10}{}".format(label, a, b, "\n")
        return "{:40}:{:10}{}".format(label, a, "\n")
    return "{:40}:{}".format(label, a)


def pretty_unique_report(df):
    "Return loggable list of unique info available in DataFrame df"
    cols = df.columns.tolist()
    out = []      # will order be preserved, or will this be jumbled?
    for col in cols:
        out.append(pretty_str("col", col))
        if len(df[col].unique()) < 20:    # Add check on avg len of unique
            out.append(pretty_str("unique values", df[col].unique().tolist()))
        else:
            out.append(pretty_str("unique count", len(df[col].unique())))
        out.append('')
    return out


def make_compare_report(l_ser, r_ser):
    "Return loggable list of set relations for two Series l_ser, r_ser"
    l_set, r_set = set(l_ser), set(r_ser)
    out = []
    out.append(pretty_str("l.isdisjoint(r)", l_set.isdisjoint(r_set)))
    out.append(pretty_str("l.issubset(r)", l_set.issubset(r_set)))
    out.append(pretty_str("l.issuperset(r)", l_set.issuperset(r_set)))
    if len(l_set.union(r_set)) < 20:
        out.append(pretty_str("l.union(r)", l_set.union(r_set)))
    else:
        out.append(pretty_str("size l.union(r)", len(l_set.union(r_set))))
    if len(l_set.intersection(r_set)) < 20:
        out.append(pretty_str("l.intersection(r)", l_set.intersection(r_set)))
    else:
        out.append(pretty_str("size l.intersection(r)",
                              len(l_set.intersection(r_set))))
    if len(l_set.difference(r_set)) < 20:
        out.append(pretty_str("l.difference(r)", l_set.difference(r_set)))
    else:
        out.append(pretty_str("size l.difference(r)",
                              len(l_set.difference(r_set))))
    if len(l_set.symmetric_difference(r_set)) < 20:
        out.append(pretty_str("l.symmetric_difference(r)",
                              l_set.symmetric_difference(r_set)))
    else:
        out.append(pretty_str("size l.symmetric_difference(r)",
                              len(l_set.symmetric_difference(r_set))))
    return out
