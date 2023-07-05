import { IsInt, IsEnum, IsOptional} from "class-validator";
import { ApiBody, ApiProduces, ApiProperty } from "@nestjs/swagger";

// more categories can be added when options are finalized
export enum Categories {
    "Frozen Tissue Present" = "npfrotispre",
    "Fixative" = "npfix",
    "Observed infarcts" = "npinf",
    "Chronic Traumatic Encephalopathy" = "npftdt7",
    "Atherosclerosis Severity" = "npavas",
    "ALS/Motor Neuron Disease" = "pathmnd",
    "Derived AD Dementia" = "pathad",
    "Age-related Tauopathy" = "relatauo",
    "FTLD with Tau Pathology" = "npftdtau",
    "FTLD with TDP-43" = "npftdtdp",
    "Hippocampal Sclerosis" = "nphipscl"     
}


export class FilterBrainData {
    
    @ApiProperty({ type: [Number], example: [20,24], description: 'Type is an array of integers. Filters the age of participants'})
    @IsOptional()
    @IsInt({
        each: true,
    })
    age_range: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters BMI of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    bmi_range: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters postmortem hours of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    postmortem_interval_hours: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters RNA integrity of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    rna_integrity: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters age at death of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    age_at_death_range: number[];
    
    @ApiProperty({ type: [String], example: ["Fixative", "Frozen Tissue Present"], description: 'Type is an array of enum Categories.'})
    @IsOptional()
    @IsEnum(Categories, {
        each: true
    })
    categories: Categories[];
}