const Sequelize = require('sequelize');
const sequelize = require('../database');

class Review extends Sequelize.Model {};

Review.init({
    mark: Sequelize.INTEGER,
}, {
    sequelize,
    tableName: "review"
});

module.exports = Review;