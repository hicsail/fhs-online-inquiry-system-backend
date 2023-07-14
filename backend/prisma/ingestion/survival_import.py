import os
from json import load
import tables
from collections import defaultdict
from fhs_utility.csv_read import yield_csv_data


survival_path = os.path.join(
    'bulk_importing', 'Gen2_Omni1', 'date_of_death-20210622_added_age_2022_09_12.csv')    

def make_survival(data, session):
    kwargs = {
        "idtype": data["idtype"],
        "id": data["id"],
        "date_of_death": data["date_of_death"],
        "age_at_death": data['age_at_death']
    }
    for i in list(kwargs.keys()):
        if kwargs[i] == "":
            kwargs.pop(i)
    session.add(tables.Survival(**kwargs))
    session.commit()


def import_survival(session): 
    survival_stream = yield_csv_data(survival_path)
    for data in survival_stream:
        data = defaultdict(lambda: '', data)
        make_survival(data, session)