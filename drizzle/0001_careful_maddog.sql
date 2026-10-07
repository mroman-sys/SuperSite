ALTER TABLE `appointments` ADD `services_json` text DEFAULT '[]' NOT NULL;--> statement-breakpoint
ALTER TABLE `clients` ADD `vip` integer DEFAULT 0 NOT NULL;