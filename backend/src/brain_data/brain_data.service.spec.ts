import { Test, TestingModule } from '@nestjs/testing';
import { HttpService } from '@nestjs/axios';
import * as request from 'supertest';
import { BrainDataService } from './brain_data.service';
import { BrainDataController } from './brain_data.controller';
import { PrismaService } from '../prisma.service';
import { FilterBrainData } from './dto/filter_brain_data.dto';
import { BrainDataModule } from './brain_data.module';
import { sum } from 'mathjs';
import { HttpStatus } from '@nestjs/common';
import { SummaryBrainData } from './dto/summary_brain_data.dto';
import { INestApplication } from '@nestjs/common';
const filters = [
  {
    age_core1: [20, 24],
    nppmih_hours: [25, 51],
    nprin: [25, 51],
    age_death: [25, 51],
    categories: { npfrotispre: 3 },
  },

  { age_core1: [-20, 24] },

  { age_core1: [21, 29] },

  { age_core1: [1] },

  { age_core1: ['1'] },

  { age_core1: [1, Number.MAX_SAFE_INTEGER] },

  // { age_core1: Array(2 ** 16 - 1).fill(0) },

  { nprin: [Number.MAX_SAFE_INTEGER * -1, Number.MAX_SAFE_INTEGER] },

  { categories: { npfrotispre: Number.MAX_SAFE_INTEGER + 1 } },

  { categories: { npfrotispre: -1 } },

  { categories: { npfrotispre: -1.0 } },

  { categories: { relatauo: [1] } },

  { categories: { relatauo: 'string' } },
];

describe('BrainDataService', () => {
  let service: BrainDataService;
  let app: INestApplication;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      imports: [BrainDataModule],
    }).compile();

    service = module.get<BrainDataService>(BrainDataService);
    app = module.createNestApplication();
    await app.init();
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
  describe('summaryResults', () => {
    const threshold = 5;

    // It would be convenient to have a constructor for the FilterBrainData class
    const filterPermutations: FilterBrainData[] = filters.map((filter) => {
      const brainFilter = new FilterBrainData();
      Object.entries(filter).map(([key, value]) => {
        brainFilter[key as keyof FilterBrainData] = value;
      });
      return brainFilter;
    });

    test.each(filterPermutations)(
      'if not 206 should be greater than threshold',
      async (filter) => {
        const res = await request(app.getHttpServer())
          .post('/brain-data')
          .send(filter)
          .set('Content-Type', 'application/json')
          .set('Accept', 'application/json');
        const summaryResults = res.body;
        const status = res.statusCode;
        
        if (status !== HttpStatus.PARTIAL_CONTENT) {
          expect(status).toBe(HttpStatus.CREATED);
          if (summaryResults != undefined) {
         
            summaryResults.map((row: SummaryBrainData) => {
              // If function resolves - can be =0 OR >=5
              try {
                expect(row['total']).toBeGreaterThanOrEqual(threshold);
              } catch {
                expect(row['total']).toBe(0);
              }
            });
          }
        } else {
          expect(status).toBe(HttpStatus.PARTIAL_CONTENT);
        }
      },
    );
    afterAll(async () => {
      await app.close();
    });
  });
});
