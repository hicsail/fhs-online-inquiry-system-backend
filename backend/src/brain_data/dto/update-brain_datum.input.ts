import { CreateBrainDatumInput } from './create-brain_datum.input';
import { InputType, Field, Int, PartialType } from '@nestjs/graphql';

@InputType()
export class UpdateBrainDatumInput extends PartialType(CreateBrainDatumInput) {
  @Field(() => Int)
  id: number;
}
