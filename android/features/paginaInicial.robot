*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder cadastrar um produto
    Dado que acessei o aplicativo
    E cadastrei um produto
    Então devo ter o produto em estoque

Usuário deve poder ter acesso às informações dos produtos cadastrados
    Dado que acessei o aplicativo
    E cadastrei um produto
    Então deve ser possível ver as informações sobre os produtos cadastrados

O usuário deve poder editar estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito as informações de um produto
    Então posso ver na página inicial que as informações foram alteradas

O usuário deve poder editar a data da compra de um produto
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito a data de compra do produto
    Então posso visualizar a nova data na página inicial

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

# O usuário não deve encontrar resultados se pesquisar por um produto não cadastrado

