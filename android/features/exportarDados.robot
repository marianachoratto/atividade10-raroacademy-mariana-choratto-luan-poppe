*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de exportar dados
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de exportar dados
    Então deve ser possível ver as informações e instruções sobre exportação de dados

Usuário deve ver mensagem de sucesso após realizar uma exportação
    Dado que realizei o cadastro de um produto
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Então deve ser possível ver uma mensagem de sucesso da exportação
    E deve ser possível ver a exportação realizada na lista de exportações

Usuário deve poder enviar dados exportados de produtos para outro lugar em seu celular
    Dado que realizei o cadastro de um produto
    E realizei a exportação de dados
    Quando acesso a funcionalidade de enviar os dados exportados
    Então o celular deverá mostrar opções de para onde enviar o arquivo exportado

# Usuário deve poder enviar dados exportados de entradas para outro lugar em seu celular
    # Dado que realizei o cadastro de um produto
    # Dado que alterei a entrada de algum produto
    # E realizei a exportação de dados
    # Quando acesso a funcionalidade de enviar os dados exportados
    # Então o celular deverá mostrar opções de para onde enviar o arquivo exportado

# Usuário deve ver mensagem de erro se tentar enviar uma exportação não existente
#     Dado que realizei o cadastro de um produto
#     Quando acesso a funcionalidade de enviar os dados exportados sem ter exportado dados previamente