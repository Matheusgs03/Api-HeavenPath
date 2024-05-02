const utils = require('../utils')

//cadastro
exports.registro = async (chave, senha) => {
    const conexao = await utils.bdConnection()
    return new Promise((resolve, reject) => {
        conexao.query(`
        SELECT U.CHAVE
        FROM USUARIO U
        WHERE U.CHAVE = ?`, [chave],
            (err, result) => {
                if (err) {
                    reject({
                        status: 410,
                        value: 'Erro: ' + err.sqlMessage
                    })
                }
                else {
                    if (result.length === 0) {
                        conexao.query(`
                        INSERT INTO 
                        USUARIO 
                        VALUES('0', ?, ?)`, [chave, senha],
                            (err) => {
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
                    }
                    else
                        resolve({
                            status: 200,
                            value: 'Tem esse emei já, cabaço'
                        })
                }
            })
    })
}

//login
exports.login = async (chave, senha) => {
    const conexao = utils.bdConnection()
    return new Promise((resolve, reject) => {
        conexao.query(`
        SELECT U.CHAVE, U.SENHA
        FROM USUARIO U
        WHERE U.CHAVE = ? `,[chave],
    async (err, result)=>{
        if(err){
            reject({
                status: 400,
                value: 'Erro:' + err.sqlMessage
            })
        }
        else{
            if(result.length){
                if(await utils.compareHash(senha, result[0].SENHA)){
                    resolve({
                        status: 200,
                        value: 'Logado'
                    })
                }
                else{
                    resolve({
                        status: 404,
                        value: 'Tem nada disso aqui não, sai vazado'
                    }) 
                }
            }
            else{
                resolve({
                    status: 404,
                    value: 'Tem nada disso aqui não, sai vazado'
                })    
            }
        }
    }
        )
    })
}
