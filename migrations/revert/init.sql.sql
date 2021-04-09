-- Revert ou-est-mon-pain:init.sql from pg

BEGIN;

DROP TABLE "category", "product", "allergen", "account", "review", "order", "stock", "product_category", "product_allergen", "account_allergen", "product_order" ;

COMMIT;
