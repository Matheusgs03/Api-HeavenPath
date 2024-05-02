const mysql = require('mysql')
const bcrypt = require('bcrypt')

module.exports = {
    //conexão com o banco de dados
    bdConnection: () => {
        const conexao = mysql.createConnection({
            host: "localhost",
            user: "root",
            password: "",
            database: "heavenpath"
        })
        return conexao
    },

    //hash da senha
    hash: async (senha) => {
        let hashPassword = await bcrypt.hash(senha, 10)
        return hashPassword
    },

     //comparar senha com hash
     compareHash: async (senha, hashPassword) => {
        return await bcrypt.compare(senha, hashPassword)
        .then(response=>response)
        .catch(err=>err)
    }
}
