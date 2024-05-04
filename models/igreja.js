const utils = require('../utils')

// sede
exports.sede = async (CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID) => {
    const conexao = await utils.bdConnection()
    return new Promise ((resolve, reject) => {
       conexao.query(`
       INSERT INTO SEDE
       VALUES ('0', ?, ?, ?, ?, ?, ?, ?, ?)`, [CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID],
       (err) =>{ 
        if (err) {
            reject({
                status: 410,
                value: 'Erro: ' + err.sqlMessage
            })
        }
        else {
            resolve({
                status: 200,
                value: 'Foi'
            })
        }
    })
    })
}

// congregacao
exports.congregacao = async (CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID, SEDE_ID) => {
    const conexao = await utils.bdConnection()
    return new Promise ((resolve, reject) => {
        conexao.query(`
        INSERT INTO CONGREGACAO
        VALUES ('0', ?, ?, ?, ?, ?, ?, ?, ?, ?)`, [CNPJ, NOME, RUA, BAIRRO, NUMERO, COMPLEMENTO, TELEFONE, GESTOR_ID, SEDE_ID],
        (err) =>{
            if(err) {
                reject({
                    status: 410,
                    value: 'Erro: ' + err.sqlMessage
                })
            }
            else{
                resolve({
                    status: 200,
                    value: 'Foi'
                })
            }
        })
    })
}