CREATE TABLE "m_user"(
    "userid" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "regid" VARCHAR(255) NOT NULL,
    "regdate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updid" VARCHAR(255) NOT NULL,
    "upddate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "version" INTEGER NOT NULL
);
ALTER TABLE
    "m_user" ADD PRIMARY KEY("userid");


CREATE TABLE "m_musclepart"(
    "musclepartid" VARCHAR(255) NOT NULL,
    "musclepartname" VARCHAR(255) NOT NULL,
    "regid" VARCHAR(255) NOT NULL,
    "regdate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updid" VARCHAR(255) NOT NULL,
    "upddate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "version" INTEGER NOT NULL
);
ALTER TABLE
    "m_musclepart" ADD PRIMARY KEY("musclepartid");


CREATE TABLE "m_menu"(
    "menuid" INTEGER NOT NULL,
    "menuname" VARCHAR(255) NOT NULL,
    "musclepartid" VARCHAR(255) NOT NULL,
    "userid" VARCHAR(255) NOT NULL,
    "status" INTEGER NOT NULL,
    "regid" VARCHAR(255) NOT NULL,
    "regdate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updid" VARCHAR(255) NOT NULL,
    "upddate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "version" INTEGER NOT NULL
);
ALTER TABLE
    "m_menu" ADD PRIMARY KEY("menuid");
COMMENT
ON COLUMN
    "m_menu"."status" IS '0 : デフォルト
1 : 各ユーザ追加';


CREATE TABLE "t_traininglog"(
    "logid" INTEGER NOT NULL,
    "menuid" INTEGER NOT NULL,
    "trainingweight" DOUBLE PRECISION NOT NULL,
    "trainingcount" INTEGER NOT NULL,
    "trainingdate" VARCHAR(255) NOT NULL,
    "trainingmemo" VARCHAR(255) NOT NULL,
    "userid" VARCHAR(255) NOT NULL,
    "regid" VARCHAR(255) NOT NULL,
    "regdate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updid" VARCHAR(255) NOT NULL,
    "upddate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "version" INTEGER NOT NULL
);
ALTER TABLE
    "t_traininglog" ADD PRIMARY KEY("logid");


CREATE TABLE "t_bodycomp"(
    "bodycompid" INTEGER NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "bfp" DOUBLE PRECISION NOT NULL,
    "date" VARCHAR(255) NOT NULL,
    "userid" VARCHAR(255) NOT NULL,
    "regid" VARCHAR(255) NOT NULL,
    "regdate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updid" VARCHAR(255) NOT NULL,
    "upddate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "version" INTEGER NOT NULL
);
ALTER TABLE
    "t_bodycomp" ADD PRIMARY KEY("bodycompid");

ALTER TABLE
    "m_menu" ADD CONSTRAINT "m_menu_userid_foreign" FOREIGN KEY("userid") REFERENCES "m_user"("userid");

ALTER TABLE
    "t_bodycomp" ADD CONSTRAINT "t_bodycomp_userid_foreign" FOREIGN KEY("userid") REFERENCES "m_user"("userid");

ALTER TABLE
    "t_traininglog" ADD CONSTRAINT "t_traininglog_userid_foreign" FOREIGN KEY("userid") REFERENCES "m_user"("userid");

ALTER TABLE
    "t_traininglog" ADD CONSTRAINT "t_traininglog_menuid_foreign" FOREIGN KEY("menuid") REFERENCES "m_menu"("menuid");

ALTER TABLE
    "m_menu" ADD CONSTRAINT "m_menu_musclepartid_foreign" FOREIGN KEY("musclepartid") REFERENCES "m_musclepart"("musclepartid");