BEGIN ;

DROP TABLE  IF EXISTS "category", "product", "allergen", "account", "review", "order", "stock", "product_category", "product_allergen", "account_allergen", "product_order" ;

CREATE TABLE "category" (
    "id" serial PRIMARY KEY,
    "label" text NOT NULL,
    "image" text NOT NULL
);

CREATE TABLE "product" (
    "id" serial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "price" float NOT NULL,
    "image" text NOT NULL
);

CREATE TABLE "allergen" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "color" text NOT NULL
);

CREATE TABLE "account" (
    "id" serial PRIMARY KEY,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "first_name" text NOT NULL,
    "last_name" text NOT NULL,
    "phone_number" integer NOT NULL,
    "role" text DEFAULT 'utilisateur'
);

CREATE TABLE "review" (
    "id" serial PRIMARY KEY,
    "mark" integer NOT NULL,
    "product_id" integer NOT NULL REFERENCES "product"("id"),
    "account_id" integer NOT NULL REFERENCES "account"("id")
);

CREATE TABLE "order" (
    "id" serial PRIMARY KEY,
    "reception_date" date NOT NULL,
    "creation_date" date DEFAULT now(),
    "state" text DEFAULT 'enregistré',
    "total_price" float NOT NULL,
    "account_id" integer NOT NULL REFERENCES "account"("id")
);

CREATE TABLE "stock" (
    "id" serial PRIMARY KEY,
    "week_day" text NOT NULL,
    "quantity" integer NOT NULL,
    "product_id" integer NOT NULL REFERENCES "product"("id")
);

CREATE TABLE "product_category" (
    "id" serial PRIMARY KEY,
    "product_id" integer NOT NULL REFERENCES "product"("id"),
    "category_id" integer NOT NULL REFERENCES "category"("id")
);

CREATE TABLE "product_allergen" (
    "id" serial PRIMARY KEY,
    "product_id" integer NOT NULL REFERENCES "product"("id"),
    "allergen_id" integer NOT NULL REFERENCES "allergen"("id")
);

CREATE TABLE "account_allergen" (
    "id" serial PRIMARY KEY,
    "account_id" integer NOT NULL REFERENCES "account"("id"),
    "allergen_id" integer NOT NULL REFERENCES "allergen"("id")
);

CREATE TABLE "product_order" (
    "id" serial PRIMARY KEY,
    "product_id" integer NOT NULL REFERENCES "product"("id"),
    "order_id" integer NOT NULL REFERENCES "order"("id"),
    "quantity" integer NOT NULL
);

COMMIT ;