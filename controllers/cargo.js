const cargo = require('../models/cargo') //model gestor

//gestor
exports.gestor = async (req, res) => {
    const {NOME, CPF, USUARIO_ID} = req.body
    let result = await cargo.gestor(NOME, CPF, USUARIO_ID)
    res.status(result.status).json(result.value)
}