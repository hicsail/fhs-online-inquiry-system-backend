import { Module } from '@nestjs/common';
import { BrainDataService } from './brain_data.service';
import { BrainDataController } from './brain_data.controller';

@Module({
  controllers: [BrainDataController],
  providers: [BrainDataService]
})
export class BrainDataModule {}
