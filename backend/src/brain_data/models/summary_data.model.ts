import { Field, ID, Int, ObjectType, Directive, Float } from '@nestjs/graphql';

@ObjectType()
export class SummaryData {

    @Field({nullable : true})
    type: string

    @Field(type => Int!)
    total: number

    @Field(type => Float) // might be a string due to ± sign needed on it
    average_age_at_death: number

    @Field(type => Int)
    hs_grad: number

    @Field(type => Int)
    college_grad: number

    @Field(type => Int)
    mri_1: number

    @Field(type => Int)
    mri_2: number    

    @Field(type => Int)
    mri_3: number

    @Field(type => Int)
    dvoice_1: number

    @Field(type => Int)
    dvoice_2: number

    @Field(type => Int)
    dvoice_3: number

    @Field(type => Int)
    smoking_ever: number

    @Field(type => Int)
    overall_dementia_probe: number

    @Field(type => Int)
    hypertension_ever: number

    @Field(type => Int)
    diabetic_ever: number


}