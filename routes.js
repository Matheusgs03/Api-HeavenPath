const express = require('express')
const routes = express.Router()
const usuario = require('./controllers/usuario')
const cargo = require('./controllers/cargo')

// rotas dos usuários
routes.post('/usuario/auth/registro', usuario.registro)
routes.post('/usuario/auth/login', usuario.login)

// rota cadastro cargos
routes.post('/cargo/gestor', cargo.gestor)


module.exports = routes