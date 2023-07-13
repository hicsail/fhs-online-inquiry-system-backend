import { Controller, Get, Body, ValidationPipe } from '@nestjs/common';
import { BrainDataService } from './brain_data.service';
import { FilterBrainData } from './dto/filter_brain_data.dto';

@Controller('brain-data')
export class BrainDataController {
  constructor(private readonly brainDataService: BrainDataService) {}

  @Get()
  brainDataSummary(@Body() filter: FilterBrainData) {
    
    return this.brainDataService.getSummary(filter);
  }

}
