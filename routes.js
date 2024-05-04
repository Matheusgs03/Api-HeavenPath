const express = require('express')
const routes = express.Router()
const usuario = require('./controllers/usuario')
const cargo = require('./controllers/cargo')
const igreja = require('./controllers/igreja')

// rotas dos usuários
routes.post('/usuario/auth/registro', usuario.registro)
routes.post('/usuario/auth/login', usuario.login)

// rota cadastro cargos
routes.post('/cargo/gestor', cargo.gestor)
routes.post('/cargo/membro', cargo.membro)

//rota cadastro igrejas
routes.post('/igreja/sede', igreja.sede)
routes. post('/igreja/congregacao', igreja.congregacao)

module.exports = routes