CREATE TABLE `appointments` (
	`id` text PRIMARY KEY NOT NULL,
	`master_id` text NOT NULL,
	`client_id` text NOT NULL,
	`day` text NOT NULL,
	`start` integer NOT NULL,
	`duration` integer NOT NULL,
	`service` text NOT NULL,
	`status` text DEFAULT 'confirmed' NOT NULL,
	`notes` text DEFAULT '' NOT NULL,
	FOREIGN KEY (`master_id`) REFERENCES `masters`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `clients` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`phone` text NOT NULL,
	`notes` text DEFAULT '' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `masters` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`hall` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `slots` (
	`appointment_id` text NOT NULL,
	`master_id` text NOT NULL,
	`day` text NOT NULL,
	`minute` integer NOT NULL,
	FOREIGN KEY (`appointment_id`) REFERENCES `appointments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `master_day_minute` ON `slots` (`master_id`,`day`,`minute`);