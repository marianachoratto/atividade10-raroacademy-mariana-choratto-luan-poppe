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

*** Keywords ***
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

# Então deve ter o produto em estoque
    