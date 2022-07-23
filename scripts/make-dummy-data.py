# dependencies
import hashlib
from random import randint
import numpy as np
import pandas as pd

# support methods
def make_id(val):
    val_to_hash = str(val)
    hash_obj = hashlib.sha1(val_to_hash.encode())
    val_hash = hash_obj.hexdigest()
    return val_hash[:10]


def make_age_data():
    vals = [randint(4, 110) for i in range(500)]
    for i in range(25):
        if (i == 13) | (i == 21):
            vals.append('N/A')
        elif (i == 6):
            vals.append(180)
        elif i % 2 == 0:
            vals.append(np.nan)
        else:
            vals.append(None)
    return vals


def make_id_data(age_data):
    ids = [make_id(age) for age in age_data]
    return ids


def shuffle(df):
    copy = df.sample(df.shape[0]).copy()
    clean_copy = copy.reset_index().drop(columns='index')
    return clean_copy

# main
if __name__ == 'main':
    df = pd.DataFrame()
    age_data = make_age_data()
    id_data = make_id_data(age_data)
    df['age'] = age_data
    df['record_id'] = id_data
    out = shuffle(df[['record_id', 'age']])
    out.to_parquet('dummy_data.parquet')