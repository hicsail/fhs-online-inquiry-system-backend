import { Test, TestingModule } from '@nestjs/testing';
import { BrainDataResolver } from './brain_data.resolver';
import { BrainDataService } from './brain_data.service';

describe('BrainDataResolver', () => {
  let resolver: BrainDataResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [BrainDataResolver, BrainDataService],
    }).compile();

    resolver = module.get<BrainDataResolver>(BrainDataResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
