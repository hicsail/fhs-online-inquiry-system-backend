'''
Imports select columns as a table into our database in bulk
'''
import os
from sqlalchemy import create_engine, MetaData, Column, Table, func, select, tuple_, Column, inspect
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from fhs_utility.csv_read import yield_csv_data
from collections import defaultdict

import digital_import
import pt_brain_tissue_import
import brain_import
import survival_import
import tables
import brain_import_revised
from tables import Core_Test


db_kwargs = {
    'drivername': 'postgresql+psycopg2',
    'host': '192.168.1.175',
    'database': 'db',
    'username': 'ned',
    'password': 'fhs1234',
    'port': '5432'
}

csv_path = os.path.join('bulk_importing', 'Gen2_Omni1',
                        'curated17_09_16_2021.csv')
brain_path = os.path.join('bulk_importing', 'Gen2_Omni1', 'biospecimen.csv')
survival_path = os.path.join(
    'bulk_importing', 'Gen2_Omni1', 'date_of_death-20210622_added_age_2022_09_12.csv')


connection_url = URL.create(**db_kwargs)
engine = create_engine(connection_url, echo=True)
Session = sessionmaker(bind=engine)


def make_objects(data, session):
    '''Returns a participant object'''

    def make_participant():
        '''Returns a participant object'''

        kwargs = {"framid": data['framid'],
                  "cohort": data["Framingham Heart Study cohort identifier"],
                  "id": data["Framingham Heart Study participant identifier within cohort"],
                  "gender": data["Participant gender"],
                  "race": data["RACE - Summary code string from combining primary codes given at different exams"],
                  "edu_core2": data["Edu_core2"],
                  "edu_core8": data["Edu_core8"]
                  }
        print(kwargs)
        for i in list(kwargs.keys()):
            if (kwargs[i] == "") | (kwargs[i] == '.'):
                kwargs.pop(i)

        session.add(tables.Participant(**kwargs))
        session.commit()

    def make_core_test(_table, test_name_csv, test_name_table):
        '''_table is a class/constructor, field in csv, field in _table'''
        test_name = test_name_csv
        tests = [test_name] * 9
        for idx, test in enumerate(tests):
            test += str(idx + 1)
            tests[idx] = test
        tmp = tests[:]
        for i in tests:
            if data[i] == '':
                tmp.remove(i)
        tests = tmp

        for i in tests:

            kwargs = {
                "framid": data['framid'],
                'core_num': i.split(test_name)[1],
                'total_tests': len(tests),
                test_name_table: data[i],
            }
            session.add(_table(**kwargs))
            session.commit()

    make_participant()

    make_core_test(tables.Age, 'Age_core', 'age')
    make_core_test(tables.Date_Core, 'date_core', 'date')
    make_core_test(tables.Height, 'Height_core', 'height')
    make_core_test(tables.Weight, 'Weight_core', 'weight')
    make_core_test(tables.BMI, 'BMI_core', 'bmi')
    make_core_test(tables.SBP, 'SBP_core', 'sbp')
    make_core_test(tables.DBP, 'DBP_core', 'dbp')
    make_core_test(tables.VENT_RT, 'VENT_RT_core', 'vent_rt')
    make_core_test(tables.Smoking, 'Smoking_core', 'smoking')
    make_core_test(tables.CPD, 'CPD_core', 'cpd')
    make_core_test(tables.BG, 'BG_core', 'bg')
    make_core_test(tables.TC, 'TC_core', 'tc')
    make_core_test(tables.Triglycerides, "Triglycerides_core", "triglycerides")
    make_core_test(tables.CALC_LDL, 'CALC_LDL_core', 'calc_ldl')
    make_core_test(tables.HDL, 'HDL_core', 'hdl')
    # make_core_test(tables.HRX, 'HRX_core', 'hrx')
    # make_core_test(tables.LIPRX, 'LIPRX_core', 'liprx')
    # make_core_test(tables.DMRX, 'DMRX_core', 'dmrx')
    # make_core_test(tables.Hip, 'Hip_core', 'hip')
    # make_core_test(tables.Waist, 'Waist_core', 'waist')
    # make_core_test(tables.Creatinine, 'Creatinine_core', 'creatinine')
    # make_core_test(tables.Fasting_bg, 'Fasting_bg_core', 'fasting_bg')
    # make_core_test(tables.Albumin, 'Albumin_core', 'albumin')
    # make_core_test(tables.AST, 'AST_core', 'ast')
    # make_core_test(tables.ALT_indicator, 'ALT_indicator_core', 'alt_indicator')
    # make_core_test(tables.Hemoglobin, 'Hemoglobin_core', 'hemoglobin')
    # make_core_test(tables.WBC, 'WBC_core', 'wbc')
    # make_core_test(tables.Aspirin, 'Aspirin_core', 'aspirin')
    # make_core_test(tables.NSAIDS, 'NSAIDS_core', 'nsaids')
    # make_core_test(tables.DepressRX, 'DepressRX_core', 'depressrx')
    # make_core_test(tables.CRP, 'CRP_core', 'crp')
    # make_core_test(tables.Fibrinoger, 'Fibrinoger_core', 'fibrinoger')
    # make_core_test(tables.Hba1c, 'Hba1c_core', 'hba1c')
    # make_core_test(tables.ICAM1, 'ICAM1_core', 'icam1')
    # make_core_test(tables.MCP1, 'MCP1_core', 'mcp1')
    # make_core_test(tables.Interleukin6, 'Interleukin6_core', 'interleukin6')
    # make_core_test(tables.Interleukin18, 'Interleukin18_core', 'interleukin18')
    # make_core_test(tables.Amyloid40, 'Amyloid40_core', 'amyloid40')
    # make_core_test(tables.Amyloid42, 'Amyloid42_core', 'amyloid42')
    # make_core_test(tables.Myeloperozidase,
    #                'Myeloperozidase_core', 'myeloperozidase')
    # make_core_test(tables.CD40, 'CD40_core', 'cd40')
    # make_core_test(tables.Cogscr, 'cogscr_core', 'cogscr')
    # Make additional table


def make_core_sequence_objects(dest_session):
    def wrap_column(name):
        name = str(name).split('.')[1]
        return ',sum(' + name + ') as ' + name
    param = ''
    for i, value in enumerate(Core_Test.__table__.columns):
        if i == 0:
            param += 'framid'
        elif i == 1:
            param += ',core_num'
        elif i == 2:
            param += ',max(total_tests) as total_tests'
        elif i == 5:
            param += ',max(date) as date'
        elif i == 3:
            pass
        else:
            param += wrap_column(value)

    raw_query = '''
            select {param}
            from core_tests where (framid,core_num) in (
                select framid,core_num 
                from core_tests 
                group by framid,core_num 
                order by framid
                )
            group by framid,core_num order by framid,core_num;
        '''.format(param=param)
    query = dest_session.execute(raw_query)

    # Finally execute the query
    for row in query:
        print(row)
        dest_session.add(tables.Core_Sequence(**row))
    dest_session.commit()
    dest_session.close()


def make_brain_data(data, session):
    '''Returns a participant object'''

    kwargs = {'idtype': data['idtype'],
              'id': data['id'],
              'framid': data['framid'],
              'nppmih': data['nppmih'],
              'nppmih_hours': data['nppmih_hours'],
              'nppmih_minutes': data['nppmih_minutes'],
              'nprin': data['nprin'],
              'npfix': data['npfix'],
              'npfrotispre': data['npfrotispre'],
              'npinf': data['npinf'],
              'npavas': data['npavas'],
              'npftdtau': data['npftdtau'],
              'npftdtdp': data['npftdtdp'],
              'npftdt7': data['npftdt7'],
              'nphipscl': data['nphipscl'],
              'PathMND': data['PathMND'],
              'PathAD': data['PathAD'],
              'relatauo': data['relatauo'],

              }

    for i in list(kwargs.keys()):
        if (kwargs[i] == "") | (kwargs[i] == '.'):
            kwargs.pop(i)

    session.add(tables.BrainData(**kwargs))
    session.commit()





def main():
    '''Main entrypoint'''

    tables.Base.metadata.drop_all(engine)
    tables.Base.metadata.create_all(engine)
    session = Session()

    stream = yield_csv_data(csv_path)

    i = 0
    for data in stream:
        i += 1
        data = defaultdict(lambda: '', data)
        make_objects(data, session)
        if i == 1000:
            break
    session.close()

    with Session() as session:
        make_core_sequence_objects(session)


    brain_import.import_brain(session)
    brain_import_revised.import_brain_revised(session)
    survival_import.import_survival(session)
    digital_import.import_digital(session)
    pt_brain_tissue_import.import_pt_brain_tissue(session)


if __name__ == '__main__':
    main()
