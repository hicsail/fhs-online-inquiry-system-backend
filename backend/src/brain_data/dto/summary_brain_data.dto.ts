import { HttpException, HttpStatus } from "@nestjs/common";
import { std, mean, round } from "mathjs";
import { createLogger, format, transports } from 'winston';

export class SummaryBrainData {
    [key: string]: string | number | undefined;
    type: string;
    total: number  = 0;
    average_age_at_death: string = "0.0";
    hs_grad: number = 0;
    college_grad: number = 0;
    mri_1: number = 0; // 1+ MRI count for a participant
    mri_2: number = 0; // 2+ MRI count for a participant
    mri_3: number = 0; // 3+ MRI count for a participant
    dvoice_1: number = 0;
    dvoice_2: number = 0;
    dvoice_3:number = 0;
    smoking_ever: number = 0;
    overall_dementia_probe: number = 0;
    hypertension_ever: number = 0;
    hyperlipidemia_ever: number = 0;
    diabetic_ever: number = 0;
    

    constructor(type:string){
        this.type = type;
    }

}

export function summarize (filteredData: any[], threshold: number) {
    
    const logger = createLogger({
        level: 'error',
        format: format.combine(
          format.timestamp({
            format: 'YYYY-MM-DD HH:mm:ss'
          }),
          format.errors({ stack: process.env.ENV === 'DEV'}),
          format.json(),
          format.splat()
        ),
        transports: [
          new transports.File({ filename: process.env.ENV === 'DEV' ? 'test-logs.log' : 'error-logs.log', level: 'error'})
        ]
    });
  
    
    const summaryArr:SummaryBrainData[] = [new SummaryBrainData("-"), new SummaryBrainData("Male"), new SummaryBrainData("Female")];
    const avg_death_arr: number[][] = [[],[],[]];
    filteredData.forEach(data => {
          if(!data.sex){
          }else{
            summaryArr[data.sex].total++;
            summaryArr[0].total++;

            avg_death_arr[data.sex].push(Number(data.age_death)); // need to assume that data will have age of death here
            avg_death_arr[0].push(Number(data.age_death)); // need to assume that data will have age of death here
            
            data.smoking_ever ? (data.smoking_ever > 0 ? (summaryArr[data.sex].smoking_ever++) : summaryArr[data.sex].smoking_ever) : (summaryArr[data.sex].smoking_ever);
            data.demrv046 ? (data.demrv046 > 0 ? summaryArr[data.sex].overall_dementia_probe++ : summaryArr[data.sex].overall_dementia_probe) : (summaryArr[data.sex].overall_dementia_probe);
            data.hrx_ever ? (data.hrx_ever > 0 ? summaryArr[data.sex].hypertension_ever++ : summaryArr[data.sex].hypertension_ever) : (summaryArr[data.sex].hypertension_ever);
            data.dmrx_ever ? (data.dmrx_ever > 0 ? summaryArr[data.sex].diabetic_ever++ : summaryArr[data.sex].diabetic_ever) : (summaryArr[data.sex].diabetic_ever);
            data.liprx_ever ? (data.liprx_ever > 0 ? summaryArr[data.sex].hyperlipidemia_ever++ : summaryArr[data.sex].hyperlipidemia_ever) : (summaryArr[data.sex].hyperlipidemia_ever);

            data.smoking_ever ? (data.smoking_ever > 0 ? summaryArr[0].smoking_ever++ : summaryArr[0].smoking_ever) : (summaryArr[0].smoking_ever);
            data.demrv046 ? (data.demrv046 > 0 ? summaryArr[0].overall_dementia_probe++ : summaryArr[0].overall_dementia_probe) : (summaryArr[0].overall_dementia_probe);
            data.hrx_ever ? (data.hrx_ever > 0 ? summaryArr[0].hypertension_ever++ : summaryArr[0].hypertension_ever) : (summaryArr[0].hypertension_ever);
            data.dmrx_ever ? (data.dmrx_ever > 0 ? summaryArr[0].diabetic_ever++ : summaryArr[0].diabetic_ever) : (summaryArr[0].diabetic_ever);
            data.liprx_ever ? (data.liprx_ever > 0 ? summaryArr[0].hyperlipidemia_ever++ : summaryArr[0].hyperlipidemia_ever) : (summaryArr[0].hyperlipidemia_ever);

            if(data.participants.edu_core2){
              if(data.participants.edu_core2 >= 12){
                summaryArr[data.sex].hs_grad++;
                summaryArr[0].hs_grad++;
              }
              if(data.participants.edu_core2 >= 16){
                summaryArr[data.sex].college_grad++;
                summaryArr[0].college_grad++;
              }
            }
            
            if(data.participants.mri_count >= 3){
              summaryArr[data.sex].mri_3++;
              summaryArr[0].mri_3++;
            }
            if(data.participants.mri_count >= 2){
              summaryArr[data.sex].mri_2++;
              summaryArr[0].mri_2++;
            } 
            if(data.participants.mri_count >= 1){
              summaryArr[data.sex].mri_1++;
              summaryArr[0].mri_1++;
            }

            if(data.participants.dvoice_count >= 3){
              summaryArr[data.sex].dvoice_3++;
              summaryArr[0].dvoice_3++;
            }
            if(data.participants.dvoice_count >= 2){
              summaryArr[data.sex].dvoice_2++;
              summaryArr[0].dvoice_2++;
            }
            if(data.participants.dvoice_count >= 1){
              summaryArr[data.sex].dvoice_1++;
              summaryArr[0].dvoice_1++;
            }

          }
    });

      if(filteredData.length > 0 && filteredData.length <= threshold){
        var errorMessage = filteredData.length === 1 ? `There is ${filteredData.length} participant that fit the criteriea. For the sake of privacy, we will not show the specifics. Please contact us for more info` 
                            : `There are ${filteredData.length} participants that fit the criteriea. For the sake of privacy, we will not show the specifics. Please contact us for more info`;

        const err = new HttpException({
            status: HttpStatus.PARTIAL_CONTENT,
            error: errorMessage,
          }, 
          HttpStatus.PARTIAL_CONTENT);
        logger.error(err);
        throw err;
      }else{
        for(const i in avg_death_arr){
          if(avg_death_arr[i].length === 0){
            continue;
          }
          const mean_calc = round(mean(avg_death_arr[i]),3);
          const stdDeviation = round(std(avg_death_arr[i]),3);
          const avgStr = `${mean_calc} ± ${stdDeviation}`;
          summaryArr[i].average_age_at_death = avgStr;
        }
        return summaryArr;
      }
}