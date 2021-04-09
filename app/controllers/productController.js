const {
    Product,
    ProductCategory,
    ProductAllergen,
    ProductOrder
} = require('../models');

const productController = {

    getAllProducts: async (req, res) => {

        const products = await Product.findAll({
            include: ['categories', 'allergens']
        });

        res.json(products);
    },

    getOneProduct: async (req, res) => {

        const {
            id
        } = req.params

        const theProduct = await Product.findByPk(id, {
            include: ['categories', 'allergens']
        })

        res.json(theProduct);

    },

    createProduct: async (req, res) => {

        try {
            const {
                title,
                description,
                price,
                image,
                categories,
                //allergens
            } = req.body;

            // Création d'un nouveau produit
            const newProduct = await Product.create({
                title,
                description,
                price,
                image
            });

            // Création des éléments de la table de liasion ProductCategory
            for (const category of categories) {
                await ProductCategory.create({
                    product_id: newProduct.id,
                    category_id: category
                })
            };

            // Création des éléments de la table de liasion ProductAllergen
            // for (const allergen of allergens) {
            //     await ProductAllergen.create({
            //         product_id: newProduct.id,
            //         allergen_id: allergen
            //     })
            // };



            res.status(201).json({
                message: 'produit créé'
            });

        } catch (error) {
            res.status(400).send(error);
        }
    },

    modifyProduct: async (req, res) => {

        try {

            const {
                id,
                title,
                description,
                price,
                image,
                categories,
                // allergens
            } = req.body;

            // Modification d'un produit
            const modifiedProduct = await Product.update({
                title,
                description,
                price,
                image
            }, {
                where: {
                    id
                }

            })

            // Suppression des éléments de la table de liasion ProductCategory pour modification
            await ProductCategory.destroy({
                where: {
                    product_id: id
                }
            });

            // Création des nouveaux éléments de la table de liasion ProductCategory
            for (const category of categories) {
                await ProductCategory.create({
                    product_id: id,
                    category_id: category
                })
            };

            // Suppression des éléments de la table de liasion ProductAllergen pour modification
            // await ProductAllergen.destroy({
            //     where: {
            //         product_id: id
            //     }
            // });

            // Création des nouveaux éléments de la table de liasion ProductAllergen
            // for (const allergen of allergens) {
            //     await ProductAllergen.create({
            //         product_id: id,
            //         allergen_id: allergen
            //     })
            // };

            res.status(200).json({
                message: 'product modifié'
            });
        } catch (error) {
            res.status(400).send(error);
        }
    },

    deleteProduct: async (req, res) => {
        try {
            const {
                id
            } = req.body;

            //On cherche si le produit est bien lié à une catégorie
            const findCategoryProduct = await ProductCategory.findOne({
                where: {
                    product_id: id
                }
            });

            if (findCategoryProduct) {
                // Suppression des éléments de la table de liasion ProductCategory
                await ProductCategory.destroy({
                    where: {
                        product_id: id
                    }
                })
            }

            // On cherche si le produit apparait déjà dans une commande
            const OrderedProduct = await ProductOrder.findOne({
                where: {
                    product_id: id
                }
            })

            //On envoie un message d'erreur s'il est déjà dans une commande
            if (OrderedProduct) {
                return res.status(400).json({
                    message: "Le produit est déjà dans une commande, il ne peut pas être supprimé"
                })
            }

            //Suppression des éléments de la table de liaison ProductOrder

            // Suppression des éléments de la table de liasion ProductAllergen
            // await ProductAllergen.destroy({
            //     where: {
            //         product_id: id
            //     }
            // })

            // Suppression du produit
            const deletedProduct = await Product.destroy({
                where: {
                    id
                }
            });

            res.status(200).json({
                message: 'produit supprimé'
            });
        } catch (error) {
            res.status(400).send(error);
        }
    }
}

module.exports = productController;