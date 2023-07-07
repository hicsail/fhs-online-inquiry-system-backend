import { IsInt, IsEnum, IsOptional} from "class-validator";
import { ApiBody, ApiProduces, ApiProperty } from "@nestjs/swagger";

// more categories can be added when options are finalized
// make it into an object instead and have a more human-readable description.
export enum Categories {
    "npfrotispre",
    "npfix",
    "npinf",
    "npftdt7",
    "npavas",
    "pathmnd",
    "pathad",
    "relatauo",
    "npftdtau",
    "npftdtdp",
    "nphipscl"     
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
    nppmih_hours: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters RNA integrity of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    nprin: number[];
    
    @ApiProperty({ type: [Number], example: [25,51], description: 'Type is an array of integers. Filters age at death of participants'})
    @IsOptional()
    @IsInt({
        each: true
    })
    age_death: number[];
    
    @ApiProperty({ type: [String], example: ["Fixative", "Frozen Tissue Present"], description: 'Type is an array of enum Categories.'})
    @IsOptional()
    @IsEnum(Categories, {
        each: true
    })
    categories: Categories[];
}