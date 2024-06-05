*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
Usuário deve poder acessar a seção de cadastro de novo produto
    Dado que acessei o aplicativo
    Quando acesso a seção de cadastrar novo produto
    Então devo conseguir ver as instruções da seção de cadastro de produto

Usuário deve poder cadastrar um produto
    Dado que acessei o aplicativo
    Quando cadastro um produto
    Então o produto deve ser adicionado ao estoque

Usuário deve poder ter acesso às informações dos produtos cadastrados
    Dado que acessei o aplicativo
    Quando cadastro um produto
    Então deve ser possível ver as informações sobre os produtos cadastrados

Não deve ser possível cadastrar um novo produto sem uma descrição
    Dado que acessei o aplicativo
    Quando cadastro um produto, mas não informo a descrição
    Então o produto não deve ser cadastrado    ${campoDescricao}

Não deve ser possível cadastrar um novo produto sem informar a quantidade
    Dado que acessei o aplicativo
    Quando cadastro um produto, mas não informo a quantidade
    Então o produto não deve ser cadastrado    ${campoQuantidade}

Não deve ser possível cadastrar um novo produto sem informar seu valor unitário
    Dado que acessei o aplicativo
    Quando cadastro um produto, mas não informo o valor unitário
    Então o produto não deve ser cadastrado    ${campoValorUnitario}

Deve ser possível cadastrar um produto sem informar código, unidade e lote
    Dado que acessei o aplicativo
    Quando cadastro um produto, mas não informo código, unidade e lote
    Então o produto deve ser adicionado ao estoque

Deve ser possível cadastrar vários produtos
    Dado que acessei o aplicativo
    E criei 2 produtos
    Então posso verificar os 2 produtos criados


Deve ser possível cadastrar produto com valores limítrofes
    [Template]    Criar e verificar produto
    Computador XP35    10    300
    Computador XP40     0    300
    Computador XP45    10    0