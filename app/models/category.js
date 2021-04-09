const Sequelize = require('sequelize');
const sequelize = require('../database');

class Category extends Sequelize.Model {};

Category.init({
    label: Sequelize.STRING,
    image: Sequelize.STRING,
}, {
    sequelize,
    tableName: "category"
});

module.exports = Category;