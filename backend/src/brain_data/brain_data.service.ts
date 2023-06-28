import { Injectable } from '@nestjs/common';
import { FilterBrainData } from './dto/filter_brain_data.dto';
import { PrismaClient } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { SummaryBrainData } from './dto/summary_brain_data.dto';

@Injectable()
export class BrainDataService {

  constructor(private prisma: PrismaService) {}

  getSummary(filter: FilterBrainData){
    //use prisma to get data
    const summaryObj = new Array<SummaryBrainData>;
    return this.prisma.brain_data.findMany();
  }
}
