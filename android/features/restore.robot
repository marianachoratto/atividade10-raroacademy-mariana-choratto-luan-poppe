*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de restore
    Quando usuário acessar a seção de restore
    Então deve ser possível ver as informações e instruções sobre restore de backup

Usuário deve poder selecionar um arquivo para restaurar um backup
    Dado que já realizei um backup antes
    E que acessei a seção de restore
    Quando executar a funcinoalidade de selecionar arquivo
    Então deve ser possível restaurar um backup a partir do backup previamente criado