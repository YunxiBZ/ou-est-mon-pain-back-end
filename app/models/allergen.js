const Sequelize = require('sequelize');
const sequelize = require('../database');

class Allergen extends Sequelize.Model {};

Allergen.init({
    name: Sequelize.STRING,
    color: Sequelize.STRING,
}, {
    sequelize,
    tableName: "allergen"
});

module.exports = Allergen;