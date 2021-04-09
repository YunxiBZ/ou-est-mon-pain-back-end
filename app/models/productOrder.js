const Sequelize = require('sequelize');
const sequelize = require('../database');

class ProductOrder extends Sequelize.Model {};

ProductOrder.init({
    quantity: Sequelize.INTEGER
}, {
    sequelize,
    tableName: "product_order"
});

module.exports = ProductOrder;