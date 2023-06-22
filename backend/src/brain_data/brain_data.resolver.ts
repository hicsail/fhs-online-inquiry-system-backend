import { Resolver, Query, Mutation, Args, Int } from '@nestjs/graphql';
import { BrainDataService } from './brain_data.service';
import { BrainDataParam } from './models/brain_data.model';
import { SummaryData } from './models/summary_data.model';

@Resolver(() => SummaryData)
export class BrainDataResolver {
  constructor(private readonly brainDataService: BrainDataService) {}

  @Query(() => [SummaryData], {name: 'summaryData'})
  getSummary(@Args('brainDataParam', {type: () => BrainDataParam}) brainDataParam: BrainDataParam) {
    return this.brainDataService.getSummary(brainDataParam)
  }
}
