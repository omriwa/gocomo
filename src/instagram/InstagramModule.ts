import { Module } from '@nestjs/common';
import { instagramController } from './instagramController';
import { instagramRepository } from './instagramRepository';

@Module({
    imports: [],
    providers: [instagramRepository],
    controllers: [instagramController],
    exports: []
})
export class instagramModule {}
