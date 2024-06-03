*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    

*** Test Cases ***
# Ver se luan consegue pegar o !
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

# Quebrar em 3 testes pequenos?
Deve ser possível cadastrar um produto sem informar código, unidade e lote
    Dado que acessei o aplicativo
    Quando cadastro um produto, mas não informo código, unidade e lote
    Então devo ter o produto em estoque