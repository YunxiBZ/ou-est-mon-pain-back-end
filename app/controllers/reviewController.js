const {
    Review
} = require('../models');
const jwt = require('jsonwebtoken');

const reviewController = {
    postReview: async (req, res) => {
        // On reprend l'ID du compte grâce au token
        const accountId = req.user.accountId;

        // On récupère l'ID et la note du produit 
        const {
            id,
            mark
        } = req.body;

        // On crée une review
        const newReview = await Review.create({
            mark,
            account_id: accountId,
            product_id: id
        })

        if (newReview) {
            res.status(201).json({
                message: 'Note envoyée'
            });
        } else {
            res.sendStatus(400);
        }
    }
};

module.exports = reviewController