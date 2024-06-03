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

Não deve ser possível diminuir estoque para números negativos
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando diminuo o estoque para um numero negativo
    Então receberei uma mensagem escrito "Estoque insuficiente"

Deve ser possível diminuir estoque para zero
    Dado que acessei o aplicativo
    E tenho um estoque de produtos cadastrados
    Quando diminuo o estoque para zero
    Então posso ver na página inicial que meu estoque é zero


