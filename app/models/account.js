const Sequelize = require('sequelize');
const sequelize = require('../database');

class Account extends Sequelize.Model {};

Account.init({
    email: Sequelize.STRING,
    password: Sequelize.STRING,
    first_name: Sequelize.STRING,
    last_name: Sequelize.STRING,
    phone_number: Sequelize.NUMBER,
    role: Sequelize.STRING
}, {
    sequelize,
    tableName: "account"
});

module.exports = Account;