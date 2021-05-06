import { Controller, Get, Post, Body } from '@nestjs/common';
import { CatsService } from './cats.service';
import { CreateCatDto } from './creat-cat.dto'; // to creat object
import { Cat } from './interface/cats.interface';

@Controller('cats')
export class CatsController {
    constructor(private readonly cs: CatsService) {}
    @Post()
    async create(@Body() createdDto: CreateCatDto) {
        this.cs.create(createdDto)
        return "Cat created: " + createdDto.name + " age "+ createdDto.age
    }
    @Get()
    async getCats(): Promise<Cat[]>{ // Promise = Future โหลดเสร็จเดี๋ยวบอกนะ
        return this.cs.findAll()
    }
}
