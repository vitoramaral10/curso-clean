Feature: Login
Como um cliente
Quero poder acessar minha conta e me manter logado

Cenário: Credenciais válidas
Dado que o cliente informou credenciais válidas
Quando solicitar para fazer o login
Então o sistema deve enviar o usuário para a tela de pesquisas
E manter o usuário logado

Cenário: Credenciais inválidas
Dado que o cliente informou credenciais inválidas
Quando solicitar para fazer o login
Então o sistema deve retornar uma mensagem de erro