const utils = require('../utils')

//gestor
exports.gestor = async (nome, cpf, usuario_id) => {
    const conexao = await utils.bdConnection()
    return new Promise((resolve, reject) => {
        conexao.query(`
        INSERT INTO GESTOR
        VALUES('0', ?, ?, ?) `, [nome, cpf, usuario_id],
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

//membro

exports.membro = async (NOME, NATURALIDADE, IDENTIDADE, ESTADO_CIVIL, CPF, PROFISSAO, OCUPACAO, REF, NOME_PAI, NOME_MAE, NOME_CONJUGE, DATA_CONVERSAO, DATA_NASCIMENTO, DATA_BATISMO, DATA_BATISMO_ESP_SANTO,
    DATA_ADMISSAO, DATA_CANCELAMENTO, DATA_READMISSAO, LUGAR_CONGREGA, CLASSE_ESC_DOMINICAL, RUA, BAIRRO, NUMERO, COMPLEMENTO, PROCEDENCIA, MOTIVO_DESTINO, LUGAR_CONVERSAO, LUGAR_BATISMO,
    LUGAR_BATIMO_ESP_SANTO, ATIVIDADES_NA_IGREJA, CONGREGACAO_ID, USUARIO_ID) => {
        const conexao = await utils.bdConnection()
        return new Promise((resolve, reject) => {
            conexao.query(`
            INSERT INTO MEMBRO
            VALUES ('0', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)` , [NOME, NATURALIDADE, IDENTIDADE, ESTADO_CIVIL, CPF, PROFISSAO, OCUPACAO, REF, NOME_PAI, NOME_MAE, NOME_CONJUGE, DATA_CONVERSAO, DATA_NASCIMENTO, DATA_BATISMO, DATA_BATISMO_ESP_SANTO,
                DATA_ADMISSAO, DATA_CANCELAMENTO, DATA_READMISSAO, LUGAR_CONGREGA, CLASSE_ESC_DOMINICAL, RUA, BAIRRO, NUMERO, COMPLEMENTO, PROCEDENCIA, MOTIVO_DESTINO, LUGAR_CONVERSAO, LUGAR_BATISMO,
                LUGAR_BATIMO_ESP_SANTO, ATIVIDADES_NA_IGREJA, CONGREGACAO_ID, USUARIO_ID],
            (err) => {
                if(err){
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
        