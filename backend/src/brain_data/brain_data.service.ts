import { Injectable } from '@nestjs/common';
import { FilterBrainData, Categories } from './dto/filter_brain_data.dto';
import { PrismaClient } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { SummaryBrainData } from './dto/summary_brain_data.dto';

@Injectable()
export class BrainDataService {

  constructor(private prisma: PrismaService) {}

  async getSummary(filter: FilterBrainData){
    //use prisma to get data

    const sex_type = [1,2];
    const summaryArr = new Array<SummaryBrainData>;
    const test = await this.prisma.brain_data.findMany({
      where:{
        // where all the input with ranges should go
        AND:[
          { age_core1 : filter.age_range ? { gte: filter.age_range[0]} : {} },
          { age_core1 : filter.age_range ? { lte: filter.age_range[1]} : {}},
          { age_death: filter.age_at_death_range ? { gte: filter.age_at_death_range[0] } : {} },
          { age_death: filter.age_at_death_range ? { lte: filter.age_at_death_range[1] } : {} },
          { nprin: filter.rna_integrity ? { gte: filter.rna_integrity[0] } : {} },
          { nprin: filter.rna_integrity ? { gte: filter.rna_integrity[1] } : {} },
          { nppmih_hours: filter.postmortem_interval_hours ? { gte: filter.postmortem_interval_hours[0]} : {} },
          { nppmih_hours: filter.postmortem_interval_hours ? { lte: filter.postmortem_interval_hours[1]} : {} },
        ]
      },
      include:{
        participants: {
          select: {
            edu_core2: true
          }
        }
      }
    });

    


    return test;
  }
}
