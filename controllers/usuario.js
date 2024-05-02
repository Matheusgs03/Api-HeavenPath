const utils = require('../utils')
const usuario = require('../models/usuario') //model usuario

//cadastro
exports.registro = async (req, res) => {
    const {CHAVE, SENHA} = req.body
    const hashPassword = await utils.hash(SENHA)
    let result = await usuario.registro(CHAVE, hashPassword)
    res.status(result.status).json(result.value)
}

//login
exports.login = async (req, res) => {
    const { CHAVE, SENHA } = req.body
    let result = await usuario.login(CHAVE, SENHA)
    res.status(result.status).json(result.value)
}