const Account = require('./account');
const Allergen = require('./allergen');
const Category = require('./category');
const Order = require('./order');
const Product = require('./product');
const Review = require('./review');
const Stock = require('./stock');
const ProductCategory = require('./productCategory');
const ProductOrder = require('./productOrder');
const ProductAllergen = require('./productAllergen');
const AccountAllergen = require('./accountAllergen');


// Relation NN Produit/Category
Product.belongsToMany(Category, {
    as: "categories",
    through: "product_category",
    foreignKey: "product_id",
    otherKey: "category_id"
});

Category.belongsToMany(Product, {
    as: "cat_products",
    through: "product_category",
    foreignKey: "category_id",
    otherKey: "product_id"
});

// Mise en place de la table de liaison ProductCategory
ProductCategory.belongsTo(Product, {
    foreignKey: 'product_id'
});

ProductCategory.belongsTo(Category, {
    foreignKey: 'category_id'
});

Product.hasMany(ProductCategory, {
    foreignKey: 'product_id'
});

Category.hasMany(ProductCategory, {
    foreignKey: 'category_id'
});

//Relation 1N Produit/Stock
Product.hasMany(Stock, {
    foreignKey: "product_id",
    as: "stocks"
});

Stock.belongsTo(Product, {
    foreignKey: "product_id",
    as: "product"
});

//Relation NN Produit/Commande
Product.belongsToMany(Order, {
    as: "orders",
    through: "product_order",
    foreignKey: "product_id",
    otherKey: "order_id"
});

Order.belongsToMany(Product, {
    as: "ord_products",
    through: "product_order",
    foreignKey: "order_id",
    otherKey: "product_id"
});

// Mise en place de la table de liaison ProductOrder
ProductOrder.belongsTo(Product, {
    foreignKey: 'product_id'
});

ProductOrder.belongsTo(Order, {
    foreignKey: 'order_id'
});

Product.hasMany(ProductOrder, {
    foreignKey: 'product_id'
});

Order.hasMany(ProductOrder, {
    foreignKey: 'order_id',
    as: 'products_in_order'
});

//Relation 1N Produit/Avis
Product.hasMany(Review, {
    foreignKey: "product_id",
    as: "reviews"
});

Review.belongsTo(Product, {
    foreignKey: "product_id",
    as: "product"
});

//Relation NN Produit/Allegène
Product.belongsToMany(Allergen, {
    as: "allergens",
    through: "product_allergen",
    foreignKey: "product_id",
    otherKey: "allergen_id"
});

Allergen.belongsToMany(Product, {
    as: "all_products",
    through: "product_allergen",
    foreignKey: "allergen_id",
    otherKey: "product_id"
});

// Mise en place de la table de liaison ProductAllergen
ProductAllergen.belongsTo(Product, {
    foreignKey: 'product_id'
});

ProductAllergen.belongsTo(Allergen, {
    foreignKey: 'allergen_id'
});

Product.hasMany(ProductAllergen, {
    foreignKey: 'product_id'
});

Allergen.hasMany(ProductAllergen, {
    foreignKey: 'allergen_id'
});

//Relation 1N Compte/Commande
Account.hasMany(Order, {
    foreignKey: "account_id",
    as: "orders"
});

Order.belongsTo(Account, {
    foreignKey: "account_id",
    as: "account"
});

// Relation 1N Compte/Avis
Account.hasMany(Review, {
    foreignKey: "account_id",
    as: "reviews"
});

Review.belongsTo(Account, {
    foreignKey: "account_id",
    as: "account"
});

// Relation NN Compte/Allergène
Account.belongsToMany(Allergen, {
    as: "allergens",
    through: "account_allergen",
    foreignKey: "account_id",
    otherKey: "allergen_id"
});

Allergen.belongsToMany(Account, {
    as: "products",
    through: "account_allergen",
    foreignKey: "allergen_id",
    otherKey: "account_id"
});

// Mise en place de la table de liaison AccountAllergen
AccountAllergen.belongsTo(Account, {
    foreignKey: 'account_id'
});

AccountAllergen.belongsTo(Allergen, {
    foreignKey: 'allergen_id'
});

Account.hasMany(AccountAllergen, {
    foreignKey: 'account_id'
});

Allergen.hasMany(AccountAllergen, {
    foreignKey: 'allergen_id'
});

module.exports = {
    Account,
    Allergen,
    Category,
    Order,
    Product,
    Review,
    Stock,
    ProductCategory,
    ProductOrder,
    ProductAllergen,
    AccountAllergen
}