import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import helmet from 'helmet';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
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

  // helmet
  app.use(helmet());
  // CORS
  app.enableCors({
    "methods": "POST",
    "origin": ["http://199.94.60.241:3021/"]
  });
  await app.listen(3000);
}
bootstrap();
