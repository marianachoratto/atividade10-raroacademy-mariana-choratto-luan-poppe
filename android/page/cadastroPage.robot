*** Settings ***
Resource    ../../base.robot

*** Variables ***
${campoCodigo}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${campoDescricao}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${campoUnidade}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${campoQuantidade}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${campoValorUnitario}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${campoLote}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${botaoSalvar}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gravar_assunto"]
${campoData}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]

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

# Então o produto não deve ser cadastrado
#     Wait Until Element Is Visible    ${campoDescricao}
#     Element Should Be Enabled    ${campoDescricao}

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

