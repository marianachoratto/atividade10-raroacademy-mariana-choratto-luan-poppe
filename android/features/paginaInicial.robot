*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Cadastrar um produto
    Dado que acessei o aplicativo
    E cadastrei um produto
    # Então deve ter o produto em estoque

O usuário deve poder documentar saída de estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrado
    Quando cadastro uma saída de estoque
    # Então