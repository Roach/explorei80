CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "waypoints" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "title" varchar(255), "location" varchar(255), "description" text, "photos" varchar(255), "icon" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20100117195126');