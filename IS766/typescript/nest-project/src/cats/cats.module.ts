import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { CatsController } from "./cats.controller";
import { CatsService } from "./cats.service";
import { CatSc, CatSchema } from "./schema/cat.schema";

@Module({
    imports: [
        MongooseModule.forFeature([{  // for connect to mongo
            name: CatSc.name,
            schema: CatSchema,
        }])
    ],
    controllers: [CatsController],
    providers: [CatsService],
})
export class CatsModule {}