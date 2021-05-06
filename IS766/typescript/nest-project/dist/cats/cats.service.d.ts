import { Model } from "mongoose";
import { CreateCatDto } from "./creat-cat.dto";
import { Cat } from "./interface/cats.interface";
import { CatSc, CatDocument } from "./schema/cat.schema";
export declare class CatsService {
    private catModel;
    constructor(catModel: Model<CatDocument>);
    create(catdto: CreateCatDto): Promise<CatSc>;
    findAll(): Promise<Cat[]>;
}
