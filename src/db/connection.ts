import postgres from 'postgres'

import { env } from '../env.ts'

import { drizzle } from 'drizzle-orm/postgres-js'

import { schema } from './schema/index.ts'

export const sql = postgres(env.DATABASE_URL)

const result = await sql `SELECT 'Hello' as message`

//console.log(result) //teste de conexao com o banco de dados pelo drizzle, deve retornar a string Hello

export const db = drizzle(sql, {
    schema,
    casing: 'snake_case',
})
