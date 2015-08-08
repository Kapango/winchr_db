create TABLE "person" (
    "id" int(11) not null,
    "name" varchar(140) not null,
    PRIMARY KEY ("id")
);
create TABLE "user" (
    "id" int(11) not null,
    "login" varchar(100) not null,
    "openid" varchar(100),
    "forename" varchar(45),
    "surname" varchar(45),
    "sex" varchar(10),
    "dob" date,
    "password" varchar(155),
    PRIMARY KEY ("id")
);
create TABLE "contact_info" (
    "id" int(11) not null,
    "user_id" int(11) not null,
    "type" varchar(45),
    "value" varchar(45),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);
CREATE UNIQUE INDEX "unique_id" ON "contact_info" ("id");
create TABLE "event" (
    "id" int(11) not null,
    "name" varchar(45),
    "location" varchar(45),
    "date" date,
    "time" time,
    "host" int(11),
    "spaces" int(11),
    "type" varchar(45),
    PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX "unique_id" ON "event" ("id");
create TABLE "match" (
    "id" int(11) not null,
    "match_id" varchar(45),
    "event_id" int(11) not null,
    "user_id" int(11) not null,
    PRIMARY KEY ("user_id"),
    FOREIGN KEY ("event_id") REFERENCES "event" ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);
CREATE UNIQUE INDEX "unique_id" ON "match" ("id");
create TABLE "registration" (
    "id" int(11) not null,
    "event_id" int(11) not null,
    "user_id" int(11) not null,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("event_id") REFERENCES "event" ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);