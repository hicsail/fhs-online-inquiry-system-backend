import { Field, ID, Int, ObjectType, InputType} from '@nestjs/graphql';

@InputType()
export class BrainDataParam {
    @Field(type => Int) 
    framId: number;

    @Field(type => Int)
    nppmih_hours: number;

    @Field(type => Int)
    nppmih_minutes: number;

    @Field(type => [Int])
    age_range: number[];
    
    @Field(type => [Int])
    bmi_range: number[];

    @Field(type => [Int], {description: 'Postmortem Interval Hours as an array of Integers'}) //Postmortem Interval Hours 
    pmih: number[];

    @Field(type => [Int], {description: 'Returns as an array of Integers'})
    rna_integrity: number[];

    @Field(type => [Int])
    age_at_death: number[];

    @Field(type => [String], {nullable: true, description: 'Neurodiseases categories'})
    neurodiseases: string[] | null;
}