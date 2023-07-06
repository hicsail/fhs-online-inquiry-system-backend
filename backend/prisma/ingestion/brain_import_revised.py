import os
from json import load
import tables
from collections import defaultdict
from fhs_utility.csv_read import yield_csv_data

brain_path = os.path.join('bulk_importing', 'Gen2_Omni1', 'inquiry_10_24.csv')


def make_brain_data(data, session):
    '''Returns a participant object'''

    kwargs = {
        "idtype" : data["idtype"],
        "id" : data["id"],
        "framid" : data["framid"],
        "sex" : data["sex"],
        "age_core1" : data["age_core1"],
        "race_code" : data["RACE_CODE"],
        "edu_core0" : data["edu_core0"],
        "edu_core17_1" : data["edu_core17_1"],
        "edu_core17_2" : data["edu_core17_2"],
        "edu_core2372" : data["edu_core2372"],
        "age_death" : data["age_death"],
        "npwhiart" : data["npwhiart"],
        "npwhimac" : data["npwhimac"],
        "npwmr" : data["npwmr"],
        "nphipscl" : data["nphipscl"],
        "npthal" : data["npthal"],
        "npbraak" : data["npbraak"],
        "npneur" : data["npneur"],
        "npadnc" : data["npadnc"],
        "npdiff" : data["npdiff"],
        "npamy" : data["npamy"],
        "npold" : data["npold"],
        "npold1" : data["npold1"],
        "npold2" : data["npold2"],
        "npold3" : data["npold3"],
        "npold4" : data["npold4"],
        "npoldd" : data["npoldd"],
        "npoldd1" : data["npoldd1"],
        "npoldd2" : data["npoldd2"],
        "npoldd3" : data["npoldd3"],
        "npoldd4" : data["npoldd4"],
        "nparter" : data["nparter"],
        "nplbod" : data["nplbod"],
        "nptdpa" : data["nptdpa"],
        "nptdpb" : data["nptdpb"],
        "nptdpc" : data["nptdpc"],
        "nptdpd" : data["nptdpd"],
        "nptdpe" : data["nptdpe"],
        "npftdtau" : data["npftdtau"],
        "nppick" : data["nppick"],
        "npftdt2" : data["npftdt2"],
        "npcort" : data["npcort"],
        "npprog" : data["npprog"],
        "npftdt5" : data["npftdt5"],
        "npftdt6" : data["npftdt6"],
        "npftdt7" : data["npftdt7"],
        "npftdt7a" : data["npftdt7a"],
        "npftdt7b" : data["npftdt7b"],
        "npftdt7c" : data["npftdt7c"],
        "npftdt7d" : data["npftdt7d"],
        "npftdt8" : data["npftdt8"],
        "npftdt9" : data["npftdt9"],
        "npftdt10" : data["npftdt10"],
        "npftdtdp" : data["npftdtdp"],
        "npalsmnd" : data["npalsmnd"],
        "npoftd" : data["npoftd"],
        "npoftd1" : data["npoftd1"],
        "npoftd2" : data["npoftd2"],
        "npoftd3" : data["npoftd3"],
        "npoftd4" : data["npoftd4"],
        "npoftd5" : data["npoftd5"],
        "npnit" : data["npnit"],
        "demrv046" : data["demrv046"],
        "demrv103" : data["demrv103"],
        "hrx_ever" : data["HRX_ever"],
        "dmrx_ever" : data["DMRX_ever"],
        "liprx_ever" : data["LIPRX_ever"],
        "smoking_ever" : data["Smoking_ever"]


              }

    for i in list(kwargs.keys()):
        if (kwargs[i] == "") | (kwargs[i] == '.'):
            kwargs.pop(i)

    session.add(tables.BrainDataPlus(**kwargs))
    session.commit()


def import_brain_revised(session):
    brain_stream = yield_csv_data(brain_path)
    for data in brain_stream:
        data = defaultdict(lambda: '', data)
        make_brain_data(data, session)
