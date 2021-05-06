import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CatsController } from './cats/cats.controller';
import { CatsModule } from './cats/cats.module';
import { CatsService } from './cats/cats.service';

@Module({
  imports: [CatsModule,
    MongooseModule.forRoot("mongodb+srv://Pailin:fxl7YYj69Wkc6JDy@cluster0.ylvu9.mongodb.net/is766?retryWrites=true&w=majority")], // to import other Module can import like this => [{ModuleName}] and remove Cats import in rows below
  controllers: [AppController],  // for Routing, to auto generate in cmd => nest g {controller name}
  providers: [AppService],  // for Logic and save Data
})                        
export class AppModule {} // to export this module as {ModuleName}
