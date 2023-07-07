import { Injectable } from '@nestjs/common';
import { FilterBrainData, Categories } from './dto/filter_brain_data.dto';
import { PrismaClient } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { SummaryBrainData } from './dto/summary_brain_data.dto';

@Injectable()
export class BrainDataService {

  constructor(private prisma: PrismaService) {}

  async getSummary(filter: FilterBrainData){
    

    const cat: any[] = filter.categories?.map((key) => {
      return { [key] : { gte : 1}}; //cant do this. Needs to be a specific number
    })
    const conditions: any[] = Object.keys(filter)?.map(key => {
      const objKey = key as keyof FilterBrainData;
      if(Array.isArray(filter[objKey]) && filter[objKey].every(it => typeof it === 'number')){
        return { [key] : { gte: filter[objKey][0], lte: filter[objKey][1]}}
      }
    }).filter((element) => element !== undefined);
    
    const queryFilter: any[] | undefined = conditions.concat(cat);
    const sex_type = [1,2];
    const summaryArr:SummaryBrainData[] = new Array<SummaryBrainData>(3);
    const filteredData = await this.prisma.brain_data.findMany({
      where:{
        AND:queryFilter
      },
      include:{
        participants: {
          select: {
            mri_count: true,
            dvoice_count: true,
            gender: true,
            edu_core2: true,
            edu_core8: true
          }
        }
      }
    });

    //write decorators to generate the query to get summary data    
    // for(const val of filteredData){
    //   summaryArr[val.participants.gender].average_age_at_death++
    // }

    return filteredData;
  }
}
