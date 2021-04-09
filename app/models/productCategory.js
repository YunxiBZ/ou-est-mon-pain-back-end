const Sequelize = require('sequelize');
const sequelize = require('../database');

class ProductCategory extends Sequelize.Model {};

ProductCategory.init({}, {
    sequelize,
    tableName: "product_category"
});

module.exports = ProductCategory;