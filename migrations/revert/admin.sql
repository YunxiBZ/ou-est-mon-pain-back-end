-- Revert ou-est-mon-pain:admin from pg

BEGIN;

UPDATE "account" SET "role" = 'user'
WHERE "email" = 'admin@gmail.com';

COMMIT;
