import { Injectable } from '@nestjs/common';
import { QuerySpecification } from '@liberation-data/drivine/query/QuerySpecification';
import { InjectPersistenceManager } from '@liberation-data/drivine/DrivineInjectionDecorators';
import { PersistenceManager } from '@liberation-data/drivine/manager/PersistenceManager';

@Injectable()
export class instagramRepository {
    constructor(@InjectPersistenceManager() readonly persistenceManager: PersistenceManager) {}

    async countAllVertices(): Promise<number> {
        const results = await this.persistenceManager.query<any>(
            new QuerySpecification(`match (n) with count(n) as count return {count: count}`)
        );

        return results[0].count;
    }

    async getUserInformation(): Promise<any> {
        const result = await this.persistenceManager.query<any>(
            new QuerySpecification(`MATCH (n) RETURN n LIMIT 25`)
        );

        return result;
    }
}
