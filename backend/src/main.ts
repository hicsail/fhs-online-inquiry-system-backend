import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

import { nestCsrf, CsrfFilter} from "ncsrf";
import cookieParser from "cookie-parser";
import helmet from 'helmet';
import { NestExpressApplication } from '@nestjs/platform-express';


async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule, {
    logger: ['error']
  });
  
  // payload validation pipes
  app.useGlobalPipes(new ValidationPipe());
  app.useBodyParser('json', {limit: '100mb'})
  // swagger documentation
  const config = new DocumentBuilder()
    .setTitle('Brain Aging Program Data')
    .setDescription('The Brain Data API description')
    .setVersion('1.0')
    .addTag('brainData')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  // HelmetJS
  app.use(helmet({
    contentSecurityPolicy: {
      directives: {
        "script-src": ["'self'"],
        "style-src": null,
      },
    },
  }));
  // CORS
  // if(process.env.ENV === 'PROD'){
    app.enableCors({
      "methods" : "POST",
      "origin" : process.env.CORS_ALLOW_LIST,
      "allowedHeaders" : ['Content-Type', 'Authorization']
    });
  // }
  await app.listen(3000);
}
bootstrap();
