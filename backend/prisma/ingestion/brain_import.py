import os
from json import load
import tables
from collections import defaultdict
from fhs_utility.csv_read import yield_csv_data

brain_path = os.path.join('bulk_importing', 'Gen2_Omni1', 'biospecimen.csv')


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


def import_brain(session):
    brain_stream = yield_csv_data(brain_path)
    for data in brain_stream:
        data = defaultdict(lambda: '', data)
        make_brain_data(data, session)
