const Sequelize = require('sequelize');
const sequelize = require('../database');

class Order extends Sequelize.Model {};

Order.init({
    reception_date: Sequelize.DATE,
    creation_date: Sequelize.DATE,
    state: Sequelize.STRING,
    total_price: Sequelize.FLOAT
}, {
    sequelize,
    tableName: "order"
});

module.exports = Order;