-- Deploy ou-est-mon-pain:admin to pg

BEGIN;

UPDATE "account" SET "role" = 'admin'
WHERE "email" = 'admin@gmail.com';

COMMIT;
