*** Settings ***
Resource    ../../base.robot

*** Variables ***
${campoCodigo}             id=br.com.pztec.estoque:id/txt_codigo
${campoDescricao}          id=br.com.pztec.estoque:id/txt_descricao
${campoUnidade}            id=br.com.pztec.estoque:id/txt_unidade
${campoQuantidade}         id=br.com.pztec.estoque:id/txt_quantidade
${campoValorUnitario}      id=br.com.pztec.estoque:id/txt_valunit
${campoLote}               id=br.com.pztec.estoque:id/txt_lote
${campoData}               id=br.com.pztec.estoque:id/data
${botaoSalvar}             id=br.com.pztec.estoque:id/btn_gravar_assunto

*** Keywords ***
Dado que realizei o cadastro de um produto
    Dado que acessei o aplicativo
    E cadastrei um produto

E cadastrei um produto
    Espera o elemento para clicar    ${botaoNovo}
    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoUnidade}    Unidade 01
    Input Text    ${campoQuantidade}    50
    Input Text    ${campoValorUnitario}    4500

    Swipe By Percent    50    40    50    10
    Input Text    ${campoLote}    Lote 01
    Espera o elemento para clicar    ${botaoSalvar}

Então devo ter o produto em estoque
    Wait Until Element Is Visible    ${estoqueProduto}
    
Quando cadastro um produto, mas não informo a descrição
    Espera o elemento para clicar    ${botaoNovo}

    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoUnidade}    Unidade 01
    Input Text    ${campoQuantidade}    50
    Input Text    ${campoValorUnitario}    4500

    Swipe By Percent    50    40    50    10

    Input Text    ${campoLote}    Lote 01

    Espera o elemento para clicar    ${botaoSalvar}

Quando cadastro um produto, mas não informo a quantidade
    Espera o elemento para clicar    ${botaoNovo}

    Wait Until Element Is Visible    ${campoCodigo}

    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoUnidade}    Unidade 01
    Input Text    ${campoValorUnitario}    4500

    Swipe By Percent    50    40    50    10

    Input Text    ${campoLote}    Lote 01

    Espera o elemento para clicar    ${botaoSalvar}

Quando cadastro um produto, mas não informo o valor unitário
    Espera o elemento para clicar    ${botaoNovo}
    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoUnidade}    Unidade 01
    Input Text    ${campoQuantidade}    50

    Swipe By Percent    50    40    50    10
    Input Text    ${campoLote}    Lote 01
    Espera o elemento para clicar    ${botaoSalvar}

Quando cadastro um produto, mas não informo código, unidade e lote
    Espera o elemento para clicar    ${botaoNovo}
    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoQuantidade}    50
    Input Text    ${campoValorUnitario}    4500
    Espera o elemento para clicar    ${botaoSalvar}

# Então o produto deve ser criado
#     [Arguments]    ${elemento}
#     Wait Until Element Is Visible    ${elemento}

Criar e verificar produto
    [Arguments]    ${nome}    ${quantidade}    ${preco}
    Dado que acessei o aplicativo
    Espera o elemento para clicar    ${botaoNovo}
    Input Text    ${campoDescricao}    ${nome}
    Input Text    ${campoQuantidade}    ${quantidade}
    Input Text    ${campoValorUnitario}    ${preco}
    Espera o elemento para clicar    ${botaoSalvar}
    Wait Until Element Is Visible    ${estoqueProduto}
    Element Should Contain Text    ${tabela_descricao_valor}    ${nome}
    Element Should Contain Text    ${tabela_quantidade_valor}    ${quantidade}
    Element Should Contain Text    ${tabela_valor_unit_valor}    ${preco},00

Criar produto
    [Arguments]    ${nome}    ${quantidade}    ${preco}
    Dado que acessei o aplicativo
    Espera o elemento para clicar    ${botaoNovo}
    Wait Until Keyword Succeeds    4    1    Input Text    ${campoDescricao}    ${nome}
    Input Text    ${campoQuantidade}    ${quantidade}
    Input Text    ${campoValorUnitario}    ${preco}
    Espera o elemento para clicar    ${botaoSalvar}


E criei 2 produtos
    FOR    ${counter}    IN RANGE    1    3
        Criar produto    Computador XP${counter}    1${counter}    30${counter}
    END

Então posso verificar os 2 produtos criados
    Page Should Contain Text    Computador XP1
    Page Should Contain Text    Computador XP2

Então não encontro o produto pesquisado
    Page Should Not Contain Element    ${estoqueProduto}