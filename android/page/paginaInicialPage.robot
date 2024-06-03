*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}               xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}      xpath=//android.widget.Button[@resource-id="android:id/button1"]
${botaoMenu}               xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]


${botaoSaidaEstoque}       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${botaoEntradaEstoque}     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]
${botãoEditar}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/editar"]

# card do produto
${estoqueProduto}         xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"]
# ${tabela_ID}    xpath=//android.widget.TextView[@text="ID"]
# ${tabela_codigo}    xpath=//android.widget.TextView[@text="Código"]

${tabela_id_valor}            xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_idprod"]
${tabela_código_valor}        xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${tabela_descricao_valor}     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${tabela_grupo_valor}         xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descateg"]
${tabela_unidade_valor}       xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${tabela_quantidade_valor}      xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${tabela_valor_unit_valor}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${tabela_lote_valor}            xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${tabela_data_valor}            xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_validade"]

*** Keywords ***
Dado que acessei o aplicativo
    Wait Until Page Contains Element    ${botaoAceitarVersao}
    Wait Until Keyword Succeeds    4    1    Espera o elemento para clicar    ${botaoAceitarVersao}

Acessar Menu
    Wait Until Page Contains Element    ${botaoMenu}
    Wait Until Keyword Succeeds    4    1    Espera o elemento para clicar    ${botaoMenu}

Então deve ser possível ver as informações sobre os produtos cadastrados
    Wait Until Page Contains Element    ${estoqueProduto}
    Element Should Contain Text    ${tabela_id_valor}    1
    Element Should Contain Text    ${tabela_código_valor}    TV Samsung 55 polegadas
    Element Should Contain Text    ${tabela_descricao_valor}    Televisão QLED com qualidade 4k
    Element Should Contain Text    ${tabela_grupo_valor}    Geral
    Element Should Contain Text    ${tabela_unidade_valor}    Unidade 01
    Element Should Contain Text    ${tabela_quantidade_valor}    50
    Element Should Contain Text    ${tabela_valor_unit_valor}    4.500,00
    Element Should Contain Text    ${tabela_lote_valor}    Lote 01
    ${current_date}=    Pegar e formatar data atual
    Element Should Contain Text    ${tabela_data_valor}    ${current_date}    