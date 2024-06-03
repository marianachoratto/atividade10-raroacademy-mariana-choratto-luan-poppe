*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
O usuário deve poder documentar saída de estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando cadastro uma saída de estoque
    Então posso ver na página inicial que houve uma diminuição no estoque

O usuário deve poder documentar entrada de estoque
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando cadastro uma entrada de estoque
    Então posso ver na página inicial que houve um aumento no estoque

