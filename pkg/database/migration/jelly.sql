CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "account_no" varchar,
  "moblie_no" varchar,
  "email" varchar,
  "address" text,
  "balance" float,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "transaction" (
  "id" integer PRIMARY KEY,
  "order_type" varchar,
  "old_balance" float,
  "new_balance" float,
  "left_amount" float,
  "account_no" varchar,
  "status" varchar,
  "created_at" timestamp
);

ALTER TABLE "transaction" ADD FOREIGN KEY ("account_no") REFERENCES "users" ("account_no");

