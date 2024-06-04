*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***
Usuário deve poder acessar a seção de gerar relatórios
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de gerar relatórios
    Então deve ser possível ver as informações e instruções sobre a seção de relatórios

