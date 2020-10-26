import { Module } from '@nestjs/common';
import { TrafficModule } from './traffic/TrafficModule';
import { DrivineModule, DrivineModuleOptions } from '@liberation-data/drivine/DrivineModule';
import { DatabaseRegistry } from '@liberation-data/drivine/connection/DatabaseRegistry';
import { MovieModule } from '@/movies/MovieModule';
import { instagramModule } from './instagram/InstagramModule';

@Module({
    imports: [
        DrivineModule.withOptions(<DrivineModuleOptions>{
            connectionProviders: [DatabaseRegistry.buildOrResolveFromEnv()]
        }),
        MovieModule,
        TrafficModule,
        instagramModule
    ],
    controllers: [],
    providers: []
})
export class AppModule {


}
