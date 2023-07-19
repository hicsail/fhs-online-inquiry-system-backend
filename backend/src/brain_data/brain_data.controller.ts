import { Controller, Body, Post } from '@nestjs/common';
import { BrainDataService } from './brain_data.service';
import { FilterBrainData } from './dto/filter_brain_data.dto';

@Controller('brain-data')
export class BrainDataController {
  constructor(private readonly brainDataService: BrainDataService) {}

  // @Get() would work if there's no body but axios doesn't accept a body with Get requests.
  @Post()
  brainDataSummary(@Body() filter: FilterBrainData) {
    
    return this.brainDataService.getSummary(filter);
  }

}
