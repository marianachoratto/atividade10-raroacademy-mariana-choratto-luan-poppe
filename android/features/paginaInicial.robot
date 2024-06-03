*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Cadastrar um produto
    Dado que acessei o aplicativo
    E cadastrei um produto
    # Então deve ter o produto em estoque

Usuário deve poder ter acesso às informações dos produtos cadastrados
    Dado que acessei o aplicativo
    E cadastrei um produto
    Então deve ser possível ver as informações sobre os produtos cadastrados

O usuário deve poder editar estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito as informações de um produto
    Então posso ver na página inicial que as informações foram alteradas

O usuário deve poder editar a data da compra
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando edito a data de compra do produto
    Então posso visualizar a nova data na página inicial

O usuário deve poder deletar um produto cadastrado
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando deleto um produto