import { PartialType } from '@nestjs/mapped-types';
import { CreateBrainDatumDto } from './create-brain_datum.dto';

export class UpdateBrainDatumDto extends PartialType(CreateBrainDatumDto) {}
