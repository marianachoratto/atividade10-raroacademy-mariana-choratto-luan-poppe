*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}                   xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}          xpath=//android.widget.Button[@resource-id="android:id/button1"]
${botaoMenu}                   xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
${paginaVazia}                 id=br.com.pztec.estoque:id/scrollView1
${inputPesquisa}               id=android:id/search_src_text
${botaoPesquisa}               id=android:id/search_button

${botaoSaidaEstoque}           xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${botaoEntradaEstoque}         xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]
${botãoEditar}                 xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/editar"]
${botaoDeletar}                id=br.com.pztec.estoque:id/deletar

# card do produto
${estoqueProduto}             xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"]

${tabela_id_valor}            xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_idprod"]
${tabela_código_valor}        xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${tabela_descricao_valor}     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${tabela_grupo_valor}         xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descateg"]
${tabela_unidade_valor}       xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${tabela_quantidade_valor}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${tabela_valor_unit_valor}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${tabela_lote_valor}          xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${tabela_data_valor}          xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_validade"]

# confirmar exclusão
${botãoModalConfirmar}        id=android:id/button1
${botãoModalNegar}            id=android:id/button2

*** Keywords ***
Dado que acessei o aplicativo
    # ${isOkVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${botaoAceitarVersao}        
    ${isOkVisible}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    3    1    Espera o elemento para clicar    ${botaoAceitarVersao}        
    
    IF    '${isOkVisible}'== ${True}
        Espera o elemento para clicar    ${botaoAceitarVersao}
    ELSE
        Log    continue
    END
    # Wait Until Page Contains Element    ${botaoAceitarVersao}
    # Wait Until Keyword Succeeds    4    1    Espera o elemento para clicar    ${botaoAceitarVersao}

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

Quando edito as informações de um produto
    Espera o elemento para clicar    ${botãoEditar}
    Wait Until Element Is Visible    ${campoCodigo}
    Clear Text    ${campoCodigo}
    Input Text    ${campoCodigo}    Ipad 12 Apple
    Swipe By Percent    50    40    50    10
    Clear Text    ${campoLote}
    Input Text    ${campoLote}    Lote 22
    Espera o elemento para clicar    ${botaoSalvar}

Então posso ver na página inicial que as informações foram alteradas
    Wait Until Element Is Visible    ${estoqueProduto}
    Element Should Contain Text    ${tabela_código_valor}    Ipad 12 Apple
    Element Should Contain Text    ${tabela_lote_valor}    Lote 22

Quando edito a data de compra do produto
    Espera o elemento para clicar    ${botãoEditar}
    Wait Until Element Is Visible    ${campoCodigo}
    Swipe By Percent    50    40    50    10
    Espera o elemento para clicar    ${campoData}
    Espera o elemento para clicar    ${calendarioMesAnterior}
    Click Text    13
    Click Element    ${botãoOk}
    Espera o elemento para clicar    ${botaoSalvar}

Então posso visualizar a nova data na página inicial
    Wait Until Page Contains Element    ${estoqueProduto}
    Element Should Contain Text    ${tabela_data_valor}    13/05/2024

Quando deleto um produto
    Espera o elemento para clicar    ${botaoDeletar}
    Espera o elemento para clicar    ${botãoModalConfirmar}

Então vejo que o produto foi deletado
    Wait Until Page Contains Element    ${paginaVazia}
    Page Should Not Contain Element    ${estoqueProduto}

Quando pesquiso por um produto
    [Arguments]    ${valorPesquisado}
    Wait Until Page Contains Element    ${estoqueProduto}        
    Click Element    ${botaoPesquisa} 
    Input Text    ${inputPesquisa}    ${valorPesquisado}    
    Press Keycode    66

Então o produto de pesquisa aparece
    Wait Until Page Contains Element    ${estoqueProduto}
    Page Should Contain Text    Computador XP1
    Page Should Not Contain Text    ComputadorXP2    