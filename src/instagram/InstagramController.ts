import { Controller, Get } from '@nestjs/common';
import { instagramRepository } from './instagramRepository';

@Controller('instagram')
export class instagramController {
    constructor(readonly instagramRepo: instagramRepository) { }

    @Get()
    async check(): Promise<string> {
        const output = await this.instagramRepo.getUserInformation();
        
        return JSON.stringify(output);
    }
}
