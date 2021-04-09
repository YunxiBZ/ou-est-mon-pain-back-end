const {
    Allergen,
    ProductAllergen
} = require('../models');

const allergenController = {

    createAllergen: async (req, res) => {

        const {
            name,
            color
        } = req.body;

        // Création d'un nouvel allergène
        const newAllergen = await Allergen.create({
            name,
            color
        })

        if (newAllergen) {
            res.status(201).json({
                message: 'allergène créé'
            });
        } else {
            res.sendStatus(400);
        }
    },

    modifyAllergen: async (req, res) => {

        const {
            id,
            name,
            color
        } = req.body;

        // Modification d'un allergène
        const modifiedAllergen = await Allergen.update({
            name,
            color
        }, {
            where: {
                id
            }

        })

        if (modifiedAllergen) {
            res.status(200).json({
                message: 'allergène modifié'
            });
        } else {
            res.sendStatus(400);
        }
    },

    deleteAllergen: async (req, res) => {

        const {
            id
        } = req.body;

        // Suppression des éléments de la table de liasion ProductAllergen pour modification
        await ProductAllergen.destroy({
            where: {
                allergen_id: id
            }
        })

        // Suppression du produit
        const deletedAllergen = await Allergen.destroy({
            where: {
                id
            }
        });

        if (deletedAllergen) {
            res.status(200).json({
                message: 'allergène supprimé'
            });
        } else {
            res.sendStatus(400);
        }
    }
}

module.exports = allergenController;