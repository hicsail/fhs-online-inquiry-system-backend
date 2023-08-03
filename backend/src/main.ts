import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

import { nestCsrf, CsrfFilter} from "ncsrf";
import cookieParser from "cookie-parser";
import helmet from 'helmet';


async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    logger: ['error']
  });
  
  // payload validation pipes
  app.useGlobalPipes(new ValidationPipe());

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
  app.use(helmet());
  // CORS
  app.enableCors({
    "methods": "POST",
    "origin": process.env.CORS_ALLOW_LIST
  });
  // CSRF
  app.use(nestCsrf());
  


  await app.listen(3000);
}
bootstrap();
