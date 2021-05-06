import { Prop, Schema, SchemaFactory} from '@nestjs/mongoose'
import { Document } from 'mongoose'

export type CatDocument = CatSc & Document

@Schema()
export class CatSc {  // this is gonnabe table name in mongo
    @Prop()
    name: string

    @Prop()
    age: number

    @Prop()
    breed: string

    // @Prop()
    // history: Array<string>
}

export const CatSchema = SchemaFactory.createForClass(CatSc)