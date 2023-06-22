import { Module } from '@nestjs/common';
import { BrainDataService } from './brain_data.service';
import { BrainDataResolver } from './brain_data.resolver';

@Module({
  providers: [BrainDataResolver, BrainDataService]
})
export class BrainDataModule {}
