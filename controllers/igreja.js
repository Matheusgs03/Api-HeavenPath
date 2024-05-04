const igreja = require('../models/igreja') //model igreja

//sede
exports.sede = async (req, res) => {
    const {CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID} = req.body
    let result = await igreja.sede(CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID)
    res.status(result.status).json(result.value)
}

exports.congregacao = async(req, res) => {
    const{CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID, SEDE_ID} = req.body
    let result = await igreja.congregacao(CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID, SEDE_ID)
    res.status(result.status).json(result.value)
}