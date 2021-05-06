import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { CreateCatDto } from "./creat-cat.dto";
import { Cat } from "./interface/cats.interface";
import { CatSc, CatDocument } from "./schema/cat.schema";


@Injectable() // means this calss can be inject
export class CatsService {
    constructor(
        @InjectModel(CatSc.name)
        private catModel: Model<CatDocument>
    ){}

    async create(catdto: CreateCatDto): Promise<CatSc> {
        const createdCat = new this.catModel(catdto)
        return createdCat.save()
    }

    async findAll(): Promise<Cat[]> {
        return this.catModel.find().exec()
    }


    ///////////////////////////////////////////////////////////////////
    //***not pernamant data
    // private readonly cats: CatDTO[] = []  

    // create(cat: Cat) {
    //     this.cats.push(cat)
    // }

    // findAll(): Cat[] {
    //     return this.cats
    // }
}