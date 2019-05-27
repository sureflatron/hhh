/*
Navicat PGSQL Data Transfer

Source Server         : postgresl
Source Server Version : 90517
Source Host           : localhost:5432
Source Database       : gql
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90517
File Encoding         : 65001

Date: 2019-05-26 21:01:14
*/


-- ----------------------------
-- Sequence structure for "public"."match_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."match_id_seq";
CREATE SEQUENCE "public"."match_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."player_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."player_id_seq";
CREATE SEQUENCE "public"."player_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."team_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."team_id_seq";
CREATE SEQUENCE "public"."team_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for "public"."match"
-- ----------------------------
DROP TABLE "public"."match";
CREATE TABLE "public"."match" (
"id" int4 DEFAULT nextval('match_id_seq'::regclass) NOT NULL,
"date" date DEFAULT ('now'::text)::date NOT NULL,
"winner_team_id" int4 NOT NULL,
"loser_team_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of match
-- ----------------------------
INSERT INTO "public"."match" VALUES ('1', '2019-05-26', '1', '2');

-- ----------------------------
-- Table structure for "public"."player"
-- ----------------------------
DROP TABLE "public"."player";
CREATE TABLE "public"."player" (
"id" int4 DEFAULT nextval('player_id_seq'::regclass) NOT NULL,
"first_name" varchar(255),
"last_name" varchar(255),
"team_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO "public"."player" VALUES ('1', 'MIGUEL', 'CLAURE', '5');
INSERT INTO "public"."player" VALUES ('2', 'ISSAC', 'VASQUEZ', '4');

-- ----------------------------
-- Table structure for "public"."team"
-- ----------------------------
DROP TABLE "public"."team";
CREATE TABLE "public"."team" (
"id" int4 DEFAULT nextval('team_id_seq'::regclass) NOT NULL,
"name" varchar(255)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO "public"."team" VALUES ('1', 'BOLIVAR');
INSERT INTO "public"."team" VALUES ('2', 'WILSTERMAN');
INSERT INTO "public"."team" VALUES ('3', 'REAL POTOSI');
INSERT INTO "public"."team" VALUES ('4', 'REAL MADRID');
INSERT INTO "public"."team" VALUES ('5', 'BARCELONA');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."match_id_seq" OWNED BY "match"."id";
ALTER SEQUENCE "public"."player_id_seq" OWNED BY "player"."id";
ALTER SEQUENCE "public"."team_id_seq" OWNED BY "team"."id";

-- ----------------------------
-- Primary Key structure for table "public"."match"
-- ----------------------------
ALTER TABLE "public"."match" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."player"
-- ----------------------------
ALTER TABLE "public"."player" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."team"
-- ----------------------------
ALTER TABLE "public"."team" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."match"
-- ----------------------------
ALTER TABLE "public"."match" ADD FOREIGN KEY ("loser_team_id") REFERENCES "public"."team" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."match" ADD FOREIGN KEY ("winner_team_id") REFERENCES "public"."team" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."player"
-- ----------------------------
ALTER TABLE "public"."player" ADD FOREIGN KEY ("team_id") REFERENCES "public"."team" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
