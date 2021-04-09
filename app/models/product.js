const Sequelize = require('sequelize');
const sequelize = require('../database');

class Product extends Sequelize.Model {};

Product.init({
    title: Sequelize.STRING,
    description: Sequelize.STRING,
    price: Sequelize.FLOAT,
    image: Sequelize.STRING
}, {
    sequelize,
    tableName: "product"
});

module.exports = Product;