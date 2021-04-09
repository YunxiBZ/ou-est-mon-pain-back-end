const jwt = require('jsonwebtoken');
const {
    Account
} = require('../models');

const adminMW = async (req, res, next) => {

    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).send('Non connecté');
    }

    try {
        const decodedPayload = jwt.verify(token, 'YuThJbAn');
        req.user = decodedPayload;

        const theUser = await Account.findByPk(decodedPayload.accountId);

        //est-ce que l'utilisateur a le role admin
        if (theUser.role !== 'admin') {
            return res.status(403).json({
                error: 'Il faut être un admin'
            });
        }

        //sinon on appelle next
        next();

    } catch (error) {
        res.status(400).json('Invalid token.');
    }

}

module.exports = adminMW;