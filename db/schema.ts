// Intentionally empty by default.
// Add Drizzle tables here when the site actually needs a database.
// See examples/d1/db/schema.ts for an opt-in example.
import { sqliteTable, text, integer, uniqueIndex } from 'drizzle-orm/sqlite-core';
export const masters = sqliteTable('masters', { id:text('id').primaryKey(), name:text('name').notNull(), hall:text('hall').notNull() });
export const clients = sqliteTable('clients', { id:text('id').primaryKey(), name:text('name').notNull(), phone:text('phone').notNull(), vip:integer('vip').notNull().default(0), notes:text('notes').notNull().default('') });
export const appointments = sqliteTable('appointments', { id:text('id').primaryKey(), masterId:text('master_id').notNull().references(()=>masters.id), clientId:text('client_id').notNull().references(()=>clients.id), day:text('day').notNull(), start:integer('start').notNull(), duration:integer('duration').notNull(), service:text('service').notNull(), servicesJson:text('services_json').notNull().default('[]'), status:text('status').notNull().default('confirmed'), notes:text('notes').notNull().default('') });
export const slots = sqliteTable('slots', { appointmentId:text('appointment_id').notNull().references(()=>appointments.id), masterId:text('master_id').notNull(), day:text('day').notNull(), minute:integer('minute').notNull() }, t=>[uniqueIndex('master_day_minute').on(t.masterId,t.day,t.minute)]);
