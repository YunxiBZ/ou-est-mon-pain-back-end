const Sequelize = require('sequelize');
const sequelize = require('../database');

class AccountAllergen extends Sequelize.Model {};

AccountAllergen.init({}, {
    sequelize,
    tableName: "account_allergen"
});

module.exports = AccountAllergen;