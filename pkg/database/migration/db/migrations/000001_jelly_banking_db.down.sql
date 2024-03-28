BEGIN;

DROP TRIGGER IF EXISTS set_updated_at_timestamp_users_table ON "users";
DROP TRIGGER IF EXISTS set_updated_at_timestamp_transaction_table ON "transaction";

DROP FUNCTION IF EXISTS set_updated_at_column();

DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "transaction" CASCADE;


DROP SEQUENCE IF EXISTS users_id_seq;
DROP SEQUENCE IF EXISTS transaction_id_seq;




COMMIT;

$ migrate -source file:C:/Users/User/Documents/GitHub/Jelly-Banking/pkg/database/migration/db/migrations -database 'postgres://jelly:123456@localhost:4444/jelly_banking_db?sslmode=disable' -verbose up 