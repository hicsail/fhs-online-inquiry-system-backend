import { Injectable, HttpException, HttpStatus, Logger} from '@nestjs/common';
import { FilterBrainData, Categories } from './dto/filter_brain_data.dto';
import { PrismaService } from 'src/prisma.service';
import { SummaryBrainData, summarize } from './dto/summary_brain_data.dto';
import { std, mean, round } from 'mathjs';
import { createLogger, format, transports } from 'winston';
import { Http } from 'winston/lib/winston/transports';

@Injectable()
export class BrainDataService {

  constructor(private prisma: PrismaService) {}
  async getSummary(filter: FilterBrainData){
    
    const logger = createLogger({
      level: 'error',
      format: format.combine(
        format.timestamp({
          format: 'YYYY-MM-DD HH:mm:ss'
        }),
        format.errors({ stack: process.env.ENV === 'DEV'}),
        format.json(),
        format.splat()
      ),
      transports: [
        new transports.File({ filename: process.env.ENV === 'DEV' ? 'test-logs.log' : 'error-logs.log', level: 'error'})
      ]
    });

    try{
    // describes minimum number of datapoints are needed after filtering for summary to be sent
    // implemented as a way for smart anonymization. Include number in .env file in future update
    const threshold = 5; 
    // building filter for "categories"
    const cat: any[] = filter.categories ? Object.keys(filter.categories)?.map(key => {
      return ( { [key] : { in : filter.categories[key]}}); 
    }) : [];

    // building filter for filter with number[] type
    const conditions: any[] = Object.keys(filter)?.map(key => {
      const objKey = key as keyof FilterBrainData;
      if(objKey !== 'categories' && Array.isArray(filter[objKey]) && filter[objKey].every(it => typeof it === 'number')){
        return { [key] : { gte: filter[objKey][0], lte: filter[objKey][1]}}
      }
    }).filter((element) => element !== undefined);
    
    const queryFilter: any[] | undefined = conditions.concat(cat);
    
    const filteredData = await this.prisma.brain_data.findMany({
      where:{
        AND: queryFilter
      },
      include:{
        participants: true
      }
    }).catch(err => {
      logger.error(err);
      throw new HttpException({
        status: HttpStatus.BAD_REQUEST,
        error: `Unknown key passed`
      },
      HttpStatus.BAD_REQUEST);
    });
    return summarize(filteredData, threshold);
    
    }catch(err){
      var e;
      if(process.env.ENV === 'DEV'){
        e = new Error(`Error with getting data summary. Cause: ${err.message}`);
        console.log(err);
      }else{
        e = new Error(`Error with getting data summary with error code ${err.status} . Try again`)
      }
      logger.error(err)
      return e.message;
    }
    
    
  }
    
}
