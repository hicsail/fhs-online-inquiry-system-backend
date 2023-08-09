import { Test, TestingModule } from '@nestjs/testing';
import { BrainDataController } from './brain_data.controller';
import { BrainDataService } from './brain_data.service';
import { PrismaService } from 'src/prisma.service';

describe('BrainDataController', () => {
  let controller: BrainDataController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [BrainDataController],
      providers: [BrainDataService, PrismaService],
    }).compile();

    controller = module.get<BrainDataController>(BrainDataController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
