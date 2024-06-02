*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Cadastrar um produto
    Dado que acessei o aplicativo
    E cadastrei um produto
    # Então deve ter o produto em estoque