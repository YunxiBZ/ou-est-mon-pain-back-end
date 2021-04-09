const {
    Account,
    AccountAllergen
} = require('../models');
const bcrypt = require('bcrypt');
const validator = require('email-validator');
const jwt = require('jsonwebtoken');

const accountController = {
    handleLoginForm: async (req, res) => {
        try {
            //on cherche à identifier le compte à partir de son email
            const email = req.body.email;
            const account = await Account.findOne({
                where: {
                    email
                }
            })

            //si aucun compte touvé avec cet email => message d'erreur
            if (!account) {
                return res.status(400).json({
                    error: 'Email ou mot de passe incorrect'
                });
            }

            //le compte avec cet email existe, on vérifie son mot de passe en comparant :
            //- la version en clair saisie dans le formulaire
            //- la version hachée stockée en BDD
            //bcrypt est capable de déterminer si les 2 version du mot de passe correcpondent
            const validPwd = await bcrypt.compare(req.body.password, account.password);

            if (!validPwd) {
                //la vérification a échoué, on envoie un message d'erreur
                return res.status(400).json({
                    error: 'Email ou mot de passe incorrect'
                });
            }


            //le user existe et s'est correctement identifié, on stocke les infos dans un token
            if (account) {
                const jwtContent = {
                    accountId: account.id
                };
                const jwtOptions = {
                    algorithm: 'HS256',
                    expiresIn: '3h'
                };

                const token = jwt.sign(jwtContent, 'YuThJbAn', jwtOptions);

                res.cookie('token', token, {
                    httpOnly: true
                })

                res.header('authorization', token).status(200).json({
                    logged: true,
                    email: account.email,
                    last_name: account.last_name,
                    first_name: account.first_name,
                    phone_number: account.phone_number,
                    role: account.role,
                    token
                });

            } else {
                res.sendStatus(401);
            }
        } catch (error) {
            console.log(error);
        }

    },

    handleSignupForm: async (req, res) => {
        try {

            //on checke si un utilisateur existe déjà avec cet email
            const account = await Account.findOne({
                where: {
                    email: req.body.email
                }
            });
            if (account) {
                //il y a déjà un utilisateur avec cet email, on envoie une erreur
                return res.status(401).json({
                    error: 'Un utilisateur avec cet email existe déjà'
                });
            }
            //on rechecke que l'email a un format valide
            if (!validator.validate(req.body.email)) {
                //le format de l'email est incorrect
                return res.status(401).json({
                    error: 'Le format de l\'email est incorrect'
                });
            }
            //on checke si le password et la vérif sont bien identiques
            if (req.body.password !== req.body.passwordConfirm) {
                return res.status(401).json({
                    error: 'La confirmation du mot de passe est incorrecte'
                });
            }
            //on hache le password
            const hashedPwd = bcrypt.hashSync(req.body.password, 10)

            //on inscrit le nouveau compte en BDD

            await Account.create({
                email: req.body.email,
                password: hashedPwd,
                last_name: req.body.last_name,
                first_name: req.body.first_name,
                phone_number: req.body.phone_number
            });
            res.sendStatus(201);
        } catch (error) {
            console.log(error);
        }
    },

    accountPage: async (req, res) => {

        const id = req.user.accountId;

        const account = await Account.findByPk(id, {
            include: ['allergens', 'orders']
        });

        res.json(account);
    },

    modifyAccount: async (req, res) => {

        const id = req.user.accountId;

        const {
            email,
            first_name,
            last_name,
            phone_number,
            //allergens
        } = req.body;

        const account = await Account.findByPk(id);

        // On vérifie s'il n'y a pas un autre compte avec l'email que l'on veut modifier
        const otherAccount = await Account.findOne({
            where: {
                email: email
            }
        });
        if (otherAccount) {
            if (otherAccount.id !== account.id) {
                //il y a déjà un utilisateur avec cet email, on envoie une erreur
                return res.status(401).json({
                    error: 'Un utilisateur avec cet email existe déjà'
                });
            }
        }
        //on rechecke que l'email a un format valide
        if (!validator.validate(email)) {
            //le format de l'email est incorrect
            return res.status(401).json({
                error: 'Le format de l\'email est incorrect'
            });
        }

        // Modification de la table account
        await Account.update({
            email,
            first_name,
            last_name,
            phone_number
        }, {
            where: {
                id
            }
        });

        // On retrouve le compte une fois modifié
        const updatedAccount = await Account.findByPk(id);

        //   // Suppression des éléments de la table de liasion AccountAllergen pour modification
        //   await AccountAllergen.destroy({
        //       where: {
        //           allergen_id: id
        //       }
        //   });

        //   // Création des nouveaux éléments de la table de liasion AccountAllergen
        //   for (const allergen of allergens) {
        //       await AccountAllergen.create({
        //           account_id: id,
        //           allergen_id: allergen
        //       })
        //   };

        if (updatedAccount) {
            res.status(200).json(updatedAccount);
        } else {
            res.sendStatus(400);
        }
    },

    modifyPassword: async (req, res) => {

        const id = req.user.accountId;

        const {
            password,
            passwordConfirm
        } = req.body;

        //on checke si le password et la vérif sont bien identiques
        if (password !== passwordConfirm) {
            return res.status(401).json({
                error: 'La confirmation du mot de passe est incorrecte'
            });
        }
        //on hache le password
        const hashedPwd = bcrypt.hashSync(password, 10)

        const modifiedAccount = await Account.update({
            password: hashedPwd
        }, {
            where: {
                id
            }
        });

        if (modifiedAccount) {
            res.status(200).json({
                message: 'Mot de passe modifié'
            });
        } else {
            res.sendStatus(400);
        }
    },

    deleteAccount: async (req, res) => {

        const id = req.user.accountId;

        // Suppression des éléments de la table de liasion AccountAllergen pour modification
        await AccountAllergen.destroy({
            where: {
                account_id: id
            }
        })

        // Suppression du compte
        const deletedAccount = await Account.destroy({
            where: {
                id
            }
        });

        if (deletedAccount) {
            res.status(200).json({
                message: 'Compte supprimé'
            });
        } else {
            res.sendStatus(400);
        }
    }
}

module.exports = accountController