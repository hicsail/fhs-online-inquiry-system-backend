import { Module } from '@nestjs/common';
import { BrainDataService } from './brain_data.service';
import { BrainDataResolver } from './brain_data.resolver';
import { PrismaService } from 'src/prisma.service';


@Module({
  providers: [BrainDataResolver, BrainDataService, PrismaService]
})
export class BrainDataModule {}
