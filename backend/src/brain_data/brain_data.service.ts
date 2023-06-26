import { Injectable } from '@nestjs/common';
import { BrainDataParam } from './models/brain_data.model';
import { PrismaClient } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class BrainDataService {
  // constructor (private prisma: PrismaService) {}


  async getSummary(params: BrainDataParam){
    // returns an array of summaryData object. Each object reflects each row
    // by the time getSummary is called, param is built and ready to use
    // use prisma client to pull data from db and build the ret object
   
    
    const ret = [{
      type: 'F',
      total: 5,
      average_age_at_death: 86.12,
      hs_grad: 3,
      college_grad: 5,
      mri_1: 2,
      mri_2: 5,
      mri_3: 7,
      dvoice_1: 1,
      dvoice_2: 2,
      dvoice_3: 3,
      smoking_ever: 3,
      overall_dementia_probe: 3,
      hypertension_ever: 3,
      diabetic_ever: 3
    },
    {
      type: 'M',
      total: 5,
      average_age_at_death: 86.12,
      hs_grad: 3,
      college_grad: 5,
      mri_1: 2,
      mri_2: 5,
      mri_3: 7,
      dvoice_1: 1,
      dvoice_2: 2,
      dvoice_3: 3,
      smoking_ever: 3,
      overall_dementia_probe: 3,
      hypertension_ever: 3,
      diabetic_ever: 3
    },
    {
      type: '-',
      total: 5,
      average_age_at_death: 86.12,
      hs_grad: 3,
      college_grad: 5,
      mri_1: 2,
      mri_2: 5,
      mri_3: 7,
      dvoice_1: 1,
      dvoice_2: 2,
      dvoice_3: 3,
      smoking_ever: 3,
      overall_dementia_probe: 3,
      hypertension_ever: 3,
      diabetic_ever: 3
    }]
    return ret
  }
}
