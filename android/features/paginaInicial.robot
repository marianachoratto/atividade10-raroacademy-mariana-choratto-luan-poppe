*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***
Usuário deve poder visualizar principais funcionalidades da página inicial
    Quando acesso o aplicativo
    Então deve ser possível ver as principais funcionalidades da página inicial

O usuário deve poder deletar um produto cadastrado
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando deleto um produto
    Então vejo que o produto foi deletado

O usuário deve poder fazer uma pesquisa de produtos
    Dado que acessei o aplicativo
    E criei 2 produtos
    Quando pesquiso por um produto    Computador XP1
    Então o produto de pesquisa aparece

O usuário não deve encontrar resultados se pesquisar por um produto não cadastrado
    Dado que acessei o aplicativo
    E criei 2 produtos
    Quando pesquiso por um produto    TV Samsung
    Então não encontro o produto pesquisado

O usuário deve poder fazer pesquisas buscando por outros campos, como preço
    Dado que acessei o aplicativo
    E criei 2 produtos
    Quando pesquiso por um produto    301
    Então encontro o card com o produto pesquisado    301,00
    E não encontro o outro produto    Computador XP2

O usuário deve poder fazer pesquisas buscando por outros campos, como quantidade
    Dado que acessei o aplicativo
    E criei 2 produtos
    Quando pesquiso por um produto    12
    Então encontro o card com o produto pesquisado    12
    E não encontro o outro produto    Computador XP1

O usuário deve poder fazer pesquisas buscando por outros campos, como unidade
    Dado que acessei o aplicativo
    E cadastrei um produto
    Quando pesquiso por um produto    Unidade 01
    Então encontro o card com o produto pesquisado    Unidade 01

O usuário deve poder fazer pesquisas buscando por outros campos, como código
    Dado que acessei o aplicativo
    E cadastrei um produto
    Quando pesquiso por um produto    TV Samsung 55
    Então encontro o card com o produto pesquisado    TV Samsung 55

O usuário deve poder editar estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito as informações de um produto
    Então posso ver na página inicial que as informações foram alteradas

O usuário deve poder alterar a data de validade de um produto
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito a data de validate do produto
    Então posso visualizar a nova data na página inicial

# Débito técnico. No celular o usuário não conseque colocar numeros negativos por causa do teclado. Porém no teste é possível e o aplicativo salva. 
O usuário não pode criar um produto com preço negativo
    Dado que acessei o aplicativo
    E criei um produto com preço negativo
    Então encontro o card com o produto pesquisado    -.450,00    

# Débito técnico. No celular o usuário não conseque colocar numeros negativos por causa do teclado. Porém no teste é possível e o aplicativo salva.
O usuário não pode criar um produto com quantidade negativa
    Dado que acessei o aplicativo
    E criei um produto com quantidade negativa
    Então encontro o card com o produto pesquisado    -99
