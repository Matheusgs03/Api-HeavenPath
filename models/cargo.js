
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
        