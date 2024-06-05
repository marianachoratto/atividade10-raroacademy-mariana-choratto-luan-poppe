*** Settings ***
Resource    ../../base.robot

*** Variables ***
${tituloPaginaInicial}         xpath=//android.widget.TextView[@text="Cadastro de Produtos"]
${botaoNovo}                   id=br.com.pztec.estoque:id/Button1
# xpath original
${botaoMenu}                   xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
${paginaVazia}                 id=br.com.pztec.estoque:id/scrollView1

# botões de modais
${botãoModalConfirmar}         id=android:id/button1
${botãoModalNegar}             id=android:id/button2
# ${botaoAceitarVersao}          xpath=//android.widget.Button[@resource-id="android:id/button1"]
# xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
# Não sei se devemos deixar esse botão para deixar claro pro breno o problema

${inputPesquisa}               id=android:id/search_src_text
${botaoPesquisa}               id=android:id/search_button

${botaoSaidaEstoque}           id=br.com.pztec.estoque:id/saida           
${botaoEntradaEstoque}         id=br.com.pztec.estoque:id/entrada        
${botãoEditar}                 id=br.com.pztec.estoque:id/editar
${botaoDeletar}                id=br.com.pztec.estoque:id/deletar

# card do produto
${cardEstoqueProduto}       id=br.com.pztec.estoque:id/linha_parte1
${tabelaIdValor}            id=br.com.pztec.estoque:id/txt_idprod
${tabelaCodigoValor}        id=br.com.pztec.estoque:id/txt_codigo
${tabelaDescricaoValor}     id=br.com.pztec.estoque:id/txt_descricao
${tabelaGrupoValor}         id=br.com.pztec.estoque:id/txt_descateg
${tabelaUnidadeValor}       id=br.com.pztec.estoque:id/txt_unidade
${tabelaQuantidadeValor}    id=br.com.pztec.estoque:id/txt_quantidade
${tabelaValorUnitValor}     id=br.com.pztec.estoque:id/txt_valunit
${tabelaLoteValor}          id=br.com.pztec.estoque:id/txt_lote
${tabelaDataValor}          id=br.com.pztec.estoque:id/txt_validade


*** Keywords ***
Dado que acessei o aplicativo
    ${isOkVisible}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    3    1    Espera o elemento para clicar    ${botãoModalConfirmar}        
    
    IF    '${isOkVisible}'== ${True}
        Espera o elemento para clicar    ${botãoModalConfirmar}
    ELSE
        Log    continue
    END

Quando acesso o aplicativo
    Dado que acessei o aplicativo

Acessar Menu
    Wait Until Keyword Succeeds    4    1    Wait Until Page Contains Element    ${botaoMenu}
    Wait Until Keyword Succeeds    4    1    Espera o elemento para clicar    ${botaoMenu}

Então deve ser possível ver as informações sobre os produtos cadastrados
    Wait Until Page Contains Element    ${cardEstoqueProduto}
    Element Should Contain Text    ${tabelaIdValor}    1
    Element Should Contain Text    ${tabelaCodigoValor}    TV Samsung 55 polegadas
    Element Should Contain Text    ${tabelaDescricaoValor}    Televisão QLED com qualidade 4k
    Element Should Contain Text    ${tabelaGrupoValor}    Geral
    Element Should Contain Text    ${tabelaUnidadeValor}    Unidade 01
    Element Should Contain Text    ${tabelaQuantidadeValor}    50
    Element Should Contain Text    ${tabelaValorUnitValor}    4.500,00
    Element Should Contain Text    ${tabelaLoteValor}    Lote 01
    ${current_date}=    Pegar e formatar data atual
    Element Should Contain Text    ${tabelaDataValor}    ${current_date} 

Quando edito as informações de um produto
    Espera o elemento para clicar    ${botãoEditar}
    Wait Until Keyword Succeeds    4    1    Wait Until Element Is Visible    ${campoCodigo}
    Clear Text    ${campoCodigo}
    Input Text    ${campoCodigo}    Ipad 12 Apple
    Swipe By Percent    50    40    50    10
    Clear Text    ${campoLote}
    Input Text    ${campoLote}    Lote 22
    Espera o elemento para clicar    ${botaoSalvar}

Então posso ver na página inicial que as informações foram alteradas
    Wait Until Element Is Visible    ${cardEstoqueProduto}
    Element Should Contain Text    ${tabelaCodigoValor}    Ipad 12 Apple
    Element Should Contain Text    ${tabelaLoteValor}    Lote 22

Quando edito a data de validate do produto
    Espera o elemento para clicar    ${botãoEditar}
    Wait Until Keyword Succeeds    4    1    Wait Until Element Is Visible    ${campoCodigo}
    Swipe By Percent    50    40    50    10
    Espera o elemento para clicar    ${campoData}
    Espera o elemento para clicar    ${calendarioMesAnterior}
    Click Text    13
    Click Element    ${botãoOk}
    Espera o elemento para clicar    ${botaoSalvar}

Então posso visualizar a nova data na página inicial
    Wait Until Page Contains Element    ${cardEstoqueProduto}
    ${hoje}=    Pegar e formatar data atual
    Element Should Not Contain Text    ${tabelaDataValor}    ${hoje}
    Should Not Be Empty    ${tabelaDataValor}

Quando deleto um produto
    Espera o elemento para clicar    ${botaoDeletar}
    Espera o elemento para clicar    ${botãoModalConfirmar}

Então vejo que o produto foi deletado
    Wait Until Page Contains Element    ${paginaVazia}
    Page Should Not Contain Element    ${cardEstoqueProduto}

Quando pesquiso por um produto
    [Arguments]    ${valorPesquisado}
    Wait Until Page Contains Element    ${cardEstoqueProduto}        
    Click Element    ${botaoPesquisa} 
    Input Text    ${inputPesquisa}    ${valorPesquisado}
    Clicar enter no celular

Então o produto de pesquisa aparece
    Espera o elemento e checa o texto    ${cardEstoqueProduto}    Computador XP1
    Page Should Not Contain Text    ComputadorXP2

Então encontro o card com o produto pesquisado
    [Arguments]    ${texto}
    Wait Until Page Contains Element    ${cardEstoqueProduto}
    Wait Until Keyword Succeeds    4    1    Page Should Contain Text    ${texto}

E criei um produto com preço negativo
    Espera o elemento para clicar    ${botaoNovo}
    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoQuantidade}    50
    Input Text    ${campoValorUnitario}    -450

    Swipe By Percent    50    40    50    10
    Espera o elemento para clicar    ${botaoSalvar}

E criei um produto com quantidade negativa
        Espera o elemento para clicar    ${botaoNovo}
    Wait Until Element Is Visible    ${campoCodigo}
    Input Text    ${campoCodigo}    TV Samsung 55 polegadas
    Input Text    ${campoDescricao}    Televisão QLED com qualidade 4k
    Input Text    ${campoQuantidade}    -99
    Input Text    ${campoValorUnitario}    450

    Swipe By Percent    50    40    50    10
    Espera o elemento para clicar    ${botaoSalvar}    

Então deve ser possível ver as principais funcionalidades da página inicial
    Wait Until Element Is Visible    ${tituloPaginaInicial}
    Element Should Be Visible    ${tituloPaginaInicial}    ${botaoPesquisa}
    Element Text Should Be    ${botaoNovo}    NOVO
    Element Text Should Be    ${botaoMenu}    MENU