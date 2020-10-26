import * as faker from 'faker';
import { INestApplication } from '@nestjs/common';
import * as stringifyObject from 'stringify-object';

export class MovieSeed  {
    public static async up(app: INestApplication) {
        const neo4jService = app.get('Neo4jService');

        const query = MovieSeed.getQuery();
        return neo4jService.query(query);
    }

    public static async down(app: INestApplication) {
        const neo4jService = app.get('Neo4jService');
        return neo4jService.query('MATCH (n:Band) DELETE n');
    }
}