*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de exportar dados
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de exportar dados
    Então deve ser possível ver as informações e instruções sobre exportação de dados

Usuário deve ver mensagem de sucesso após realizar uma exportação de produto
    Dado que realizei o cadastro de um produto
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Então deve ser possível ver uma mensagem de sucesso da exportação
    E deve ser possível ver a exportação realizada na lista de exportações    ${historicoExportacaoTextoProduto}

Usuário deve poder enviar dados exportados de produtos para outro lugar em seu celular
    Dado que realizei o cadastro de um produto
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados de produtos
    Então o celular deverá mostrar opções de para onde enviar o arquivo exportado

Usuário deve ver mensagem de sucesso após realizar uma exportação de entrada
    Dado que realizei uma entrada de algum produto
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Então deve ser possível ver uma mensagem de sucesso da exportação
    E deve ser possível ver a exportação realizada na lista de exportações    ${historicoExportacaoTextoEntrada}

Usuário deve poder enviar dados exportados de entradas para outro lugar em seu celular
    Dado que realizei uma entrada de algum produto
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados de entradas
    Então o celular deverá mostrar opções de para onde enviar o arquivo exportado

Usuário deve ver mensagem de sucesso após realizar uma exportação de saída
    Dado que realizei uma saída de algum produto
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Então deve ser possível ver uma mensagem de sucesso da exportação
    E deve ser possível ver a exportação realizada na lista de exportações    ${historicoExportacaoTextoSaida}

Usuário deve poder enviar dados exportados de saídas para outro lugar em seu celular
    Dado que realizei uma saída de algum produto
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados de saídas
    Então o celular deverá mostrar opções de para onde enviar o arquivo exportado


Usuário deve poder enviar dados exportados de grupos de produtos para outro lugar em seu celular
    Dado que realizei uma alteração nos grupos de produtos
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados de grupos
    Então o celular deverá mostrar opções de para onde enviar o arquivo exportado



# POSSÍVEL BUG
# Usuário deve ver mensagem de sucesso após realizar uma exportação de grupos
#     Dado que realizei o cadastro de um produto
#     E que realizei uma alteração nos grupos de produtos
#     E que acessei a seção de exportar dados
#     Quando executo a funcionalidade de exportar dados
#     Então deve ser possível ver uma mensagem de sucesso da exportação
#     E deve ser possível ver a exportação realizada na lista de exportações    ${historicoExportacaoTextoGrupos}


Usuário deve ver mensagem de erro se tentar enviar uma exportação não existente
    Dado que realizei o cadastro de um produto
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados de entradas
    Então deverá ser possível a mensagem de erro