import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class BrainDatum {
  @Field(() => Int, { description: 'Example field (placeholder)' })
  exampleField: number | null;
}
