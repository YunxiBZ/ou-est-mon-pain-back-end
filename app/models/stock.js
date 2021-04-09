const Sequelize = require('sequelize');
const sequelize = require('../database');

class Stock extends Sequelize.Model {};

Stock.init({
    week_day: Sequelize.STRING,
    quantity: Sequelize.INTEGER,
}, {
    sequelize,
    tableName: "stock"
});

module.exports = Stock;