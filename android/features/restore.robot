*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de restore
    Quando usuário acessar a seção de restore
    Então deve ser possível ver as informações e instruções sobre restore de backup

Usuário deve poder selecionar um arquivo para restaurar um backup
    Dado que acessei a seção de restore
    E que já realizei um backup antes
    Quando executar a funcinoalidade de selecionar arquivo
    Então deve ser possível selecionar um arquivo da pasta onde os backups são guardados

# Usuário deve poder enviar um backup
#     Dado que acessei a seção de backup
#     Quando executar a funcinoalidade de enviar backup
#     Então o celular deverá mostrar opções de para onde enviar o backup
