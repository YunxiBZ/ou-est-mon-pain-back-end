-- Revert ou-est-mon-pain:fake_data from pg

BEGIN;

DELETE FROM "product_category";

DELETE FROM "product_order";

DELETE FROM "product";

DELETE FROM "category";

DELETE FROM "allergen";

COMMIT;