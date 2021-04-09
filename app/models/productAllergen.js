const Sequelize = require('sequelize');
const sequelize = require('../database');

class ProductAllergen extends Sequelize.Model {};

ProductAllergen.init({}, {
    sequelize,
    tableName: "product_allergen"
});

module.exports = ProductAllergen;