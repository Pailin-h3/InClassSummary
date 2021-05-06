import { Document } from 'mongoose';
export declare type CatDocument = CatSc & Document;
export declare class CatSc {
    name: string;
    age: number;
    breed: string;
}
export declare const CatSchema: import("mongoose").Schema<Document<CatSc, {}>, import("mongoose").Model<any, any>, undefined>;
