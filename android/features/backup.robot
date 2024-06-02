*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de backup
    Quando usuário acessar a seção de backup
    Então deve ser possível ver as informações e instruções sobre backup

Usuário deve poder gerar um backup
    Dado que acessei a seção de backup
    Quando executar a funcinoalidade de gerar backup
    Então o backup deve ser gerado com sucesso

Usuário deve poder enviar um backup
    Dado que acessei a seção de backup
    Quando executar a funcinoalidade de enviar backup
    Então o celular deverá mostrar opções de para onde enviar o backup