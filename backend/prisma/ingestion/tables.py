from sqlalchemy import Column, Integer, String, Enum, Date, ForeignKey, Numeric, Time, Interval, inspect, MetaData, Table, PrimaryKeyConstraint
from sqlalchemy.orm import declarative_base


Base = declarative_base()


def object_as_dict(obj):
    return {c.key: getattr(obj, c.key)
            for c in inspect(obj).mapper.column_attrs}


class Participant(Base):
    '''Defines a framingham heart study participant'''
    __tablename__ = 'participants'

    framid = Column('framid', Integer, primary_key=True)
    cohort = Column('cohort', Integer)
    id = Column('id', Integer)
    gender = Column('gender', Integer, nullable=True)
    race = Column('race', String)
    edu_core2 = Column('edu_core2', Integer, nullable=True)
    edu_core8 = Column('edu_core8', Integer, nullable=True)

    def __repr__(self):
        return str(self.__dict__)


class BrainData(Base):
    __tablename__ = 'brain_data'
    idtype = Column('idtype', Integer)
    id = Column('id', Integer)
    framid = Column('framid', Integer, primary_key=True)
    nppmih = Column('nppmih', Interval)
    nppmih_hours = Column('nppmih_hours', Integer)
    nppmih_minutes = Column('nppmih_minutes', Integer)
    nprin = Column('nprin', Numeric)
    npfix = Column('npfix', Integer)
    npfrotispre = Column('npfrotispre', Integer)
    npinf = Column('npinf', Integer)
    npavas = Column('npavas', Integer)
    npftdtau = Column('npftdtau', Integer)
    npftdtdp = Column('npftdtdp', Integer)
    npftdt7 = Column('npftdt7', Integer)
    nphipscl = Column('nphipscl', Integer)
    PathMND = Column('pathmnd', Integer)
    PathAD = Column('pathad', Integer)
    relatauo = Column('relatauo', Integer)

class BrainDataPlus(Base):
    __tablename__ = 'brain_data_plus'
    idtype = Column("idtype",Integer)
    id = Column("id",Integer)
    framid = Column("framid",Integer,primary_key=True)
    sex = Column("sex",Integer)
    age_core1 = Column("age_core1",Integer)
    race_code = Column("race_code",String)
    edu_core0 = Column("edu_core0",Integer)
    edu_core17_1 = Column("edu_core17_1",Integer)
    edu_core17_2 = Column("edu_core17_2",Integer)
    edu_core2372 = Column("edu_core2372",Integer)
    age_death = Column("age_death",Numeric)
    npwhiart = Column("npwhiart",Integer)
    npwhimac = Column("npwhimac",Integer)
    npwmr = Column("npwmr",Integer)
    nphipscl = Column("nphipscl",Integer)
    npthal = Column("npthal",Integer)
    npbraak = Column("npbraak",Integer)
    npneur = Column("npneur",Integer)
    npadnc = Column("npadnc",Integer)
    npdiff = Column("npdiff",Integer)
    npamy = Column("npamy",Integer)
    npold = Column("npold",Integer)
    npold1 = Column("npold1",Integer)
    npold2 = Column("npold2",Integer)
    npold3 = Column("npold3",Integer)
    npold4 = Column("npold4",Integer)
    npoldd = Column("npoldd",Integer)
    npoldd1 = Column("npoldd1",Integer)
    npoldd2 = Column("npoldd2",Integer)
    npoldd3 = Column("npoldd3",Integer)
    npoldd4 = Column("npoldd4",Integer)
    nparter = Column("nparter",Integer)
    nplbod = Column("nplbod",Integer)
    nptdpa = Column("nptdpa",Integer)
    nptdpb = Column("nptdpb",Integer)
    nptdpc = Column("nptdpc",Integer)
    nptdpd = Column("nptdpd",Integer)
    nptdpe = Column("nptdpe",Integer)
    npftdtau = Column("npftdtau",Integer)
    nppick = Column("nppick",Integer)
    npftdt2 = Column("npftdt2",Integer)
    npcort = Column("npcort",Integer)
    npprog = Column("npprog",Integer)
    npftdt5 = Column("npftdt5",Integer)
    npftdt6 = Column("npftdt6",Integer)
    npftdt7 = Column("npftdt7",Integer)
    npftdt7a = Column("npftdt7a",Integer)
    npftdt7b = Column("npftdt7b",Integer)
    npftdt7c = Column("npftdt7c",Integer)
    npftdt7d = Column("npftdt7d",Integer)
    npftdt8 = Column("npftdt8",Integer)
    npftdt9 = Column("npftdt9",Integer)
    npftdt10 = Column("npftdt10",Integer)
    npftdtdp = Column("npftdtdp",Integer)
    npalsmnd = Column("npalsmnd",Integer)
    npoftd = Column("npoftd",Integer)
    npoftd1 = Column("npoftd1",Integer)
    npoftd2 = Column("npoftd2",Integer)
    npoftd3 = Column("npoftd3",Integer)
    npoftd4 = Column("npoftd4",Integer)
    npoftd5 = Column("npoftd5",Integer)
    npnit = Column("npnit",Integer)
    demrv046 = Column("demrv046",Integer)
    demrv103 = Column("demrv103",Integer)
    hrx_ever = Column("hrx_ever",Integer)
    dmrx_ever = Column("dmrx_ever",Integer)
    liprx_ever = Column("liprx_ever",Integer)
    smoking_ever = Column("smoking_ever",Integer)

class Survival(Base):
    __tablename__ = 'survival'
    idtype = Column('idtype', Integer, primary_key=True)
    id = Column('id', Integer, primary_key=True)
    date_of_death = Column('date_of_death', Date)
    age_at_death = Column('age_at_death', Integer)
    


class MRIDates(Base):
    __tablename__ = 'mri_dates'
    idtype = Column('idtype', Integer, primary_key=True)
    id = Column('id', Integer, primary_key=True)
    mri_date = Column('mri_date', Date, primary_key=True)
    num_mri = Column('num_mri', Integer)
    sex = Column('sex', Integer)
class DvoiceDates(Base):
    __tablename__ = 'dvoice_dates'
    idtype = Column('idtype', Integer, primary_key=True)
    id = Column('id', Integer, primary_key=True)
    dvoice_date = Column('dvoice_date', Date, primary_key=True)
    num_dvoice = Column('num_dvoice', Integer)
    sex = Column('sex', Integer)

class DCDTDates(Base):
    __tablename__ = 'dcdt_dates'
    idtype = Column('idtype', Integer, primary_key=True)
    id = Column('id', Integer, primary_key=True)
    dcdt_date = Column('dcdt_date', Date, primary_key=True)
    num_dcdt = Column('num_dcdt', Integer)
    sex = Column('sex', Integer)

class DerivedDCDTDates(Base):
    __tablename__ = 'derived_dcdt_dates'
    idtype = Column('idtype', Integer, primary_key=True)
    id = Column('id', Integer, primary_key=True)
    derived_dcdt_date = Column('derived_dcdt_date', Date, primary_key=True)
    num_derived_dcdt = Column('num_derived_dcdt', Integer)
    sex = Column('sex', Integer)





class Core_Test(Base):

    __tablename__ = 'core_tests'
    framid = Column('framid', Integer, ForeignKey(
        'participants.framid'), primary_key=True)
    core_num = Column('core_num', Integer, primary_key=True)
    total_tests = Column('total_tests', Integer)
    type = Column(String, primary_key=True)

    __mapper_args__ = {
        "polymorphic_identity": "core_test",
        "polymorphic_on": type,
    }


class Age(Core_Test):

    age = Column('age', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "age",
    }


class Date_Core(Core_Test):

    date = Column('date', Date)

    __mapper_args__ = {
        "polymorphic_identity": "date",
    }


class Height(Core_Test):

    height = Column('height', Numeric)

    __mapper_args__ = {
        "polymorphic_identity": "height",
    }


class Weight(Core_Test):

    weight = Column('weight', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "weight",
    }


class BMI(Core_Test):

    bmi = Column('bmi', Numeric)

    __mapper_args__ = {
        "polymorphic_identity": "bmi",
    }


class SBP(Core_Test):

    sbp = Column('sbp', Numeric)

    __mapper_args__ = {
        "polymorphic_identity": "sbp",
    }


class DBP(Core_Test):

    dbp = Column('dbp', Numeric)

    __mapper_args__ = {
        "polymorphic_identity": "dbp",
    }


class VENT_RT(Core_Test):

    vent_rt = Column('vent_rt', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "vent_rt",
    }


class Smoking(Core_Test):

    smoking = Column('smoking', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "smoking",
    }


class CPD(Core_Test):

    cpd = Column('cpd', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "cpd",
    }


class BG(Core_Test):

    bg = Column('bg', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "bg",
    }


class TC(Core_Test):

    tc = Column('tc', Integer)

    __mapper_args__ = {
        "polymorphic_identity": "tc",
    }


class Triglycerides(Core_Test):
    triglycerides = Column('triglycerides', Integer)
    __mapper_args__ = {
        "polymorphic_identity": "triglycerides"
    }


class CALC_LDL(Core_Test):
    calc_ldl = Column('calc_ldl', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'calc_ldl'
    }


class HDL(Core_Test):
    hdl = Column('hdl', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'hdl'
    }


class HRX(Core_Test):
    hrx = Column('hrx', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'hrx'
    }


class LIPRX(Core_Test):
    liprx = Column('liprx', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'liprx'
    }


class DMRX(Core_Test):
    dmrx = Column('dmrx', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'dmrx'
    }


class Hip(Core_Test):
    hip = Column('hip', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'hip'
    }


class Waist(Core_Test):
    waist = Column('waist', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'waist'
    }


class Creatinine(Core_Test):
    creatinine = Column('creatinine', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'creatinine'
    }


class Fasting_bg(Core_Test):
    fasting_bg = Column('fasting_bg', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'fasting_bg'
    }


class Albumin(Core_Test):
    albumin = Column('albumin', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'albumin'
    }


class AST(Core_Test):
    ast = Column('ast', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'ast'
    }


class ALT_indicator(Core_Test):
    alt_indicator = Column('alt_indicator', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'alt_indicator'
    }


class Hemoglobin(Core_Test):
    hemoglobin = Column('hemoglobin', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'hemoglobin'
    }


class WBC(Core_Test):
    wbc = Column('wbc', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'wbc'
    }


class Aspirin(Core_Test):
    aspirin = Column('aspirin_cc', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'aspirin_cc'
    }


class NSAIDS(Core_Test):
    nsaids = Column('nsaids_cc', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'nsaids_cc'
    }


class DepressRX(Core_Test):
    depressrx = Column('depressrx', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'depressrx'
    }


class CRP(Core_Test):
    crp = Column('crp', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'crp'
    }


class Fibrinoger(Core_Test):
    fibrinoger = Column('fibrinoger', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'fibrinoger'
    }


class Hba1c(Core_Test):
    hba1c = Column('hba1c', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'hba1c'
    }


class ICAM1(Core_Test):
    icam1 = Column('icam1', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'icam1'
    }


class MCP1(Core_Test):
    mcp1 = Column('mcp1', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'mcp1'
    }


class Interleukin6(Core_Test):
    interleukin6 = Column('interleukin6', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'interleukin6'
    }


class Interleukin18(Core_Test):
    interleukin18 = Column('interleukin18', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'interleukin18'
    }


class Amyloid40(Core_Test):
    amyloid40 = Column('amyloid40', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'amyloid40'
    }


class Amyloid40_Indicator(Core_Test):
    amyloid40_indicator = Column('amyloid40_indicator', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'amyloid40_indicator'
    }


class Amyloid42(Core_Test):
    amyloid42 = Column('amyloid42', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'amyloid42'
    }


class Myeloperozidase(Core_Test):
    myeloperozidase = Column('myeloperozidase', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'myeloperozidase'
    }


class CD40(Core_Test):
    cd40 = Column('cd40', Numeric)
    __mapper_args__ = {
        'polymorphic_identity': 'cd40'
    }


class Cogscr(Core_Test):
    cogscr = Column('cogscr', Integer)
    __mapper_args__ = {
        'polymorphic_identity': 'cogscr'
    }


def create_core_sequence_table():
    metadata = Base.metadata
    columns = Core_Test.__table__.columns.items()
    columns = [Column(name, value.type)
               for name, value in columns if name != 'type']
    table = Table("core_sequence", metadata, *columns)

    return table


class Core_Sequence(Base):
    __tablename__ = 'core_sequence'
    __table__ = create_core_sequence_table()

    __table_args__ = (
        PrimaryKeyConstraint(
            __table__.columns['framid'],
            __table__.columns['core_num']),
        {})
