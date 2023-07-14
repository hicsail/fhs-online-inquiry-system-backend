import os
from json import load
import tables
from collections import defaultdict
from fhs_utility.csv_read import yield_csv_data


pt_path = os.path.join(
    'bulk_importing', 'Gen2_Omni1', "inquiry.csv")

framids = {81359,
           81376,
           81497,
           81579,
           81674,
           81676,
           81760,
           81781,
           81793,
           81925,
           82127,
           82194,
           82196,
           82230,
           82248,
           82272,
           82273,
           82314,
           82337,
           82368,
           82626,
           82656,
           82703,
           82790,
           82791,
           82804,
           82888,
           82893,
           82894,
           82956,
           83211,
           83260,
           83261,
           83405,
           83458,
           83468,
           83562,
           83788,
           83886,
           83949,
           84132,
           84137,
           84183,
           84356,
           84368,
           84376,
           84529,
           84627,
           84870,
           84880,
           84912,
           85109,
           85236,
           86009,
           86022,
           86064,
           86072,
           86178,
           86351,
           86364,
           86489,
           86603,
           86657,
           86664,
           86668,
           86688,
           86846,
           86875,
           86878,
           86919,
           87038,
           87040,
           87255,
           87505,
           87601,
           87818,
           87831,
           87862,
           87928,
           87999,
           88000,
           88020,
           88024,
           88183}

def edu_core0_convert(code):
    edu_core8 = None
    edu_core2 = None
    if code == "0":
        edu_core8 = "0"
        edu_core2 = "0"
    elif (code == "1") | (code == "2"):
        edu_core8 = "1"
        edu_core2 = "8"
    elif (code == "3") | (code == "4"):
        edu_core8 = "2"
        edu_core2 = "11"
    elif code == "5":
        edu_core8 = '3'
        edu_core2 = "12"
    elif code == "6":
        edu_core8 = '4'
        edu_core2 = "13"

    elif code == "7":
        edu_core8 = "7"
        edu_core2 = "16"
    elif code == "8":
        edu_core8 = "8"
        edu_core2 = "20"

    elif code == "9999":
        edu_core8 = "."
    elif code == "10":
        edu_core8 = "5"
        edu_core2 = "13"
    return edu_core8, edu_core2


def import_pt_brain_tissue(session):
    '''Imports participants from inquiry csv -- DOES NOT import pts from gen 2 -- those come from curated sheet'''
    def make_participant(data, session):
        edu_core8, edu_core2 = None, None
        if data["idtype"] == '0':
            edu_core8, edu_core2 = edu_core0_convert(data['edu_core0'])
        elif (data['idtype'] == '2') | (data['idtype'] == '3'):
            edu_core8 = data['edu_core2372']
        else:
            edu_core8, edu_core2 = data['edu_core17_2'], data['edu_core17_1']
        kwargs = {"framid": data['framid'],
                  "cohort": data["idtype"],
                  "id": data["id"],
                  "gender": data["sex"],
                  "race": data["RACE_CODE"],
                  "edu_core2": edu_core2,
                  "edu_core8": edu_core8
                  }
        for i in list(kwargs.keys()):
            if (kwargs[i] == "") | (kwargs[i] == '.'):
                kwargs.pop(i)
        if (kwargs['cohort'] != '1') | (int(kwargs['framid']) in framids):
            session.add(tables.Participant(**kwargs))

        session.commit()

    pt_stream = yield_csv_data(pt_path)
    for data in pt_stream:
        data = defaultdict(lambda: '', data)
        make_participant(data, session)
    print(framids)