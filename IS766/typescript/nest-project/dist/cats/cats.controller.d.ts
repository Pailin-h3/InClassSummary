import { CatsService } from './cats.service';
import { CreateCatDto } from './creat-cat.dto';
import { Cat } from './interface/cats.interface';
export declare class CatsController {
    private readonly cs;
    constructor(cs: CatsService);
    create(createdDto: CreateCatDto): Promise<string>;
    getCats(): Promise<Cat[]>;
}
