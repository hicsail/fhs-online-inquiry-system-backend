import { IsInt, IsEnum, IsOptional} from "class-validator";


// more categories can be added when options are finalized
enum Categories {
    "Frozen Tissue Present",
    "Fixative",
    "Chronic Traumatic Encephalopathy",
    "Atherosclerosis Severity",
    "ALS/Motor Neuron Disease",
    "Derived AD Dementia"    
}


export class FilterBrainData {
    
    @IsOptional()
    @IsInt({
        each: true,
        
    })
    age_range: number[];
    
    @IsOptional()
    @IsInt({
        each: true
    })
    bmi_range: number[];
    
    @IsOptional()
    @IsInt({
        each: true
    })
    postmortem_interval_hours: number[];
    
    @IsOptional()
    @IsInt({
        each: true
    })
    rna_integrity: number[];
    
    @IsOptional()
    @IsInt({
        each: true
    })
    age_at_death_range: number[];
    
    @IsOptional()
    @IsEnum(Categories, {
        each: true
    })
    categories: Categories[];
}