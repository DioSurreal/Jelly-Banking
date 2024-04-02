BEGIN;

--Set timezone
SET TIME ZONE 'Asia/Bangkok';

--Install uuid extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--users_id -> U000001

--Create sequence
CREATE SEQUENCE users_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE transaction_id_seq START WITH 1 INCREMENT BY 1;

--Auto update
CREATE OR REPLACE FUNCTION set_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;   
END;
$$ language 'plpgsql';

CREATE TABLE "users" (
  "id" varchar PRIMARY KEY DEFAULT CONCAT('U', LPAD(NEXTVAL('users_id_seq')::TEXT, 6, '0')),
  "fname" varchar,
  "lname" varchar,
  "account_no" varchar  UNIQUE,
  "moblie_no" varchar,
  "email" varchar,
  "password" VARCHAR NOT NULL,
  "role_id" INT NOT NULL,
  "balance" float,
  "created_at" timestamp DEFAULT now(),
  "updated_at" timestamp DEFAULT now()
);

CREATE TABLE "transaction" (
  "id" varchar PRIMARY KEY DEFAULT CONCAT('U', LPAD(NEXTVAL('transaction_id_seq')::TEXT, 6, '0')),
  "order_type" varchar,
  "old_balance" float,
  "new_balance" float,
  "amount" float,
  "account_no" varchar,
  "created_at" timestamp DEFAULT now()
);

CREATE TABLE "oauth" (
  "id" uuid NOT NULL UNIQUE PRIMARY KEY DEFAULT uuid_generate_v4(),
  "user_id" VARCHAR NOT NULL,
  "access_token" VARCHAR NOT NULL,
  "refresh_token" VARCHAR NOT NULL,
  "created_at" TIMESTAMP NOT NULL DEFAULT now(),
  "updated_at" TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR NOT NULL UNIQUE
);

ALTER TABLE "transaction" ADD FOREIGN KEY ("account_no") REFERENCES "users" ("account_no");
ALTER TABLE "oauth" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id")  ON DELETE CASCADE;
ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;


CREATE TRIGGER set_updated_at_timestamp_users_table BEFORE UPDATE ON "users" FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();
CREATE TRIGGER set_updated_at_timestamp_transaction_table BEFORE UPDATE ON "transaction" FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();
CREATE TRIGGER set_updated_at_timestamp_oauth_table BEFORE UPDATE ON "oauth" FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();
COMMIT;