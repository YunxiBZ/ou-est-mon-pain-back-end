const jwt = require('jsonwebtoken');

const userMW = async (req, res, next) => {

    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).send('Non connecté');
    }

    try {
        const decodedPayload = jwt.verify(token, 'YuThJbAn');
        req.user = decodedPayload;
        next();
    } catch (error) {
        res.status(400).json('Invalid token.');
    }
}

module.exports = userMW;