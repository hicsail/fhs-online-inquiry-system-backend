import { Injectable } from '@nestjs/common';
import { FilterBrainData } from './dto/filter_brain_data.dto';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class BrainDataService {
  getSummary(filter: FilterBrainData){

  }
}
