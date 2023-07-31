import { Test, TestingModule } from '@nestjs/testing';
import { HttpModule } from '@nestjs/axios';
import { BrainDataService } from './brain_data.service';
import { BrainDataController } from './brain_data.controller';
import { PrismaService } from '../prisma.service';
import { FilterBrainData } from './dto/filter_brain_data.dto';
import { sum } from 'mathjs';

describe('BrainDataService', () => {
  let service: BrainDataService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [BrainDataController],
      providers: [BrainDataService, PrismaService],
    }).compile();

    service = module.get<BrainDataService>(BrainDataService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('summaryResults', () => {
    const threshold = 5;
    const filter = new FilterBrainData();

    filter.age_core1 = [20, 24];
    filter.bmi = [25, 51];
    filter.nppmih_hours = [25, 51];
    filter.nprin = [25, 51];
    filter.age_death = [25, 51];
    // filter.categories = { npfrotispre: 3 };

    const entries = Object.entries(filter);
    const out = entries.reduce((arr, group) => {
      const itms = Object.values(group)[1];
      const vals = Object.values(itms);
      // if first time, set up the initial arrays with first set of data
      if (!arr.length) {
        return vals.map((v) => [v]);
      }
      // after first one, we will just loop over the arrays
      // and start adding the next set of data to each one
      return arr.reduce<number[][]>((updated, curr) => {
        vals.forEach((val: number) => {
          // make copy so we are not adding data to the reference
          const copy = (<number[]>curr).slice();
          copy.push(val);
          updated.push(copy);
        });
        return updated;
      }, []);
    }, []);
    console.log(out);
    const filterPermutations: FilterBrainData[] = [filter];

    test.each(filterPermutations)(
      'if not 206 should be greater than threshold',
      async (filter) => {
        const summaryResults = await service.getSummary(filter);
        console.log(summaryResults);
        summaryResults.map((row) => {
          expect(row['total']).toBeGreaterThanOrEqual(threshold);
        });
      },
    );
  });
});
