import os
from json import load
import tables


digital_path = os.path.join(
    'bulk_importing', 'Gen2_Omni1', 'remap_(15448)_20220913_11_13_19_0058_enumerate_fhs_pts.json')


def import_digital(session):
    digital_dict = dict()
    with open(digital_path,) as f:
        digital_dict = load(f)

    def make_digital(pt_id, values, session):
        '''Returns a participant object'''

        idtype, id_value = pt_id.split('-')

        for date, _ in values['all_mri_dates'].items():

            MRIDates_kwargs = {'idtype': idtype,
                               'id': id_value,
                               'mri_date': date,
                               'num_mri': values['num_mri'],
                               'sex': values['sex']
                               }
            session.add(tables.MRIDates(**MRIDates_kwargs))

        for date, _ in values['dvoice_dates'].items():
            DvoiceDates_kwargs = {'idtype': idtype,
                                  'id': id_value,
                                  'dvoice_date': date,
                                  'num_dvoice': values['num_dvoice'],
                                  'sex': values['sex']
                                  }
            session.add(tables.DvoiceDates(**DvoiceDates_kwargs))
        for date, _ in values['anon_dcdt_dates'].items():
            DCDTDates_kwargs = {'idtype': idtype,
                                'id': id_value,
                                'dcdt_date': date,
                                'num_dcdt': values['num_anon_dcdt'],
                                'sex': values['sex']
                                }
            session.add(tables.DCDTDates(**DCDTDates_kwargs))
        for date, _ in values['derived_dcdt_dates'].items():
            DerivedDCDTDates_kwargs = {'idtype': idtype,
                                       'id': id_value,
                                       'derived_dcdt_date': date,
                                       'num_derived_dcdt': values['num_derived_dcdt'],
                                       'sex': values['sex']
                                       }
            session.add(tables.DerivedDCDTDates(**DerivedDCDTDates_kwargs))

        session.commit()
    for pt_id, values in digital_dict.items():

        make_digital(pt_id, values, session)
