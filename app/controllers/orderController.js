const {
    Order,
    ProductOrder
} = require('../models')
const jwt = require('jsonwebtoken')

const orderController = {

    postOrder: async (req, res) => {

        const {
            reception_date,
            total_price,
            products
        } = req.body

        // On reprend l'ID du compte grâce au user
        const id = req.user.accountId;

        // On crée une nouvelle commande
        const newOrder = await Order.create({
            reception_date,
            total_price,
            account_id: id,
        });

        // On rajoute les produits dans la table commande, avec leur quantité
        for (const product of products) {
            await ProductOrder.create({
                order_id: newOrder.id,
                product_id: product.id,
                quantity: product.quantity
            })
        }

        if (newOrder) {
            res.status(201).json({
                message: 'Commande effectuée'
            });
        } else {
            res.sendStatus(400);
        }
    },

    OrdersById: async (req, res) => {

        const id = req.user.accountId;

        // On récupère toute les commandes du compte concerné
        const orders = await Order.findAll({
            where: {
                account_id: id
            },
            include: ['ord_products', 'products_in_order']
        });

        if (orders) {
            res.json(orders);
        } else {
            res.json("Il n'y a pas de commandes de cet utilisateur");
        }
    },

    OrdersByDay: async (req, res) => {

        const theDate = new Date();

        const dailyOrders = await Order.findAll({
            where: {
                reception_date: theDate
            },
            include: ['ord_products', 'products_in_order']
        })

        if (dailyOrders) {
            res.json(dailyOrders);
        } else {
            res.json("Il n'y a pas de commandes aujourd'hui");
        }
    }
};

module.exports = orderController;