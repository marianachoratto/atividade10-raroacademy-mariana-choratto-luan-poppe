*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases ***
Usuário deve poder acessar a seção de gerar relatórios
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de gerar relatórios
    Então deve ser possível ver as informações e instruções sobre a seção de relatórios

Usuário deve poder gerar um relatório com informações sobre o inventário
    Dado que acessei a seção de relatório de inventário
    Quando executo a funcionalidade de gerar relatório em pdf
    Então o PDF deve ser gerado    inventario.pdf
    E deve poder ser visualizado pelo celular
    E deve poder ser enviado pelo celular    inventario.pdf

Usuário deve poder gerar um relatório com informações sobre as entradas
    Dado que acessei a seção de relatório de entradas
    E adicionei uma data inicial e final
    Quando executo a funcionalidade de gerar relatório em pdf
    Então o PDF deve ser gerado    relatentrada.pdf
    E deve poder ser visualizado pelo celular
    E deve poder ser enviado pelo celular    relatentrada.pdf

Usuário deve poder gerar um relatório com informações sobre as saídas
    Dado que acessei a seção de relatório de saídas
    E adicionei uma data inicial e final
    Quando executo a funcionalidade de gerar relatório em pdf
    Então o PDF deve ser gerado    relatsaida.pdf
    E deve poder ser visualizado pelo celular
    E deve poder ser enviado pelo celular    relatsaida.pdf

Usuário não deve poder gerar um relatório com informações sobre as entradas sem passar valores de datas
    Dado que acessei a seção de relatório de entradas
    Quando executo a funcionalidade de gerar relatório em pdf sem preencher nenhuma data
    Então deve aparecer uma mensagem de erro ao gerar o relatório

Usuário não deve poder gerar um relatório com informações sobre as saídas sem passar valores de datas
    Dado que acessei a seção de relatório de saídas
    Quando executo a funcionalidade de gerar relatório em pdf sem preencher nenhuma data
    Então deve aparecer uma mensagem de erro ao gerar o relatório