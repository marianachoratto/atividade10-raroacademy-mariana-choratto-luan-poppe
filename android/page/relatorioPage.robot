*** Settings ***
Resource    ../../base.robot

*** Variables ***
${telaRelatorio}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloRelatorio}    id=br.com.pztec.estoque:id/lbl_titulo
${propagandaRelatorio}    id=br.com.pztec.estoque:id/adView_relat
${botaoInventarioRelatorio}    id=br.com.pztec.estoque:id/inventario
${botaoEntradasRelatorio}    id=br.com.pztec.estoque:id/relentrada
${botaoSaidasRelatorio}    id=br.com.pztec.estoque:id/relsaida

${tituloSubRelatorio}    id=br.com.pztec.estoque:id/lbl_titulo
${gerarPDFSubRelatorio}    id=br.com.pztec.estoque:id/btn_gerar
${infoSubRelatorio}    id=br.com.pztec.estoque:id/datafile
${visualizarSubRelatorio}    id=br.com.pztec.estoque:id/btn_abrir
${enviarSubRelatorio}    id=br.com.pztec.estoque:id/btn_email
${dataInicioSubRelatorio}    id=br.com.pztec.estoque:id/data1
${dataFinalSubRelatorio}    id=br.com.pztec.estoque:id/data2
${mensagemErroSubRelatorio}    id=android:id/message


*** Keywords ***
Dado que acessei a seção de relatório de inventário
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de gerar relatórios
    Espera o elemento para clicar    ${botaoInventarioRelatorio}

Dado que acessei a seção de relatório de entradas
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de gerar relatórios
    Espera o elemento para clicar    ${botaoEntradasRelatorio}

E adicionei uma data inicial e final
    Espera o elemento para clicar    ${dataInicioSubRelatorio}
    Espera o elemento para clicar    ${botaoOkCalendario}
    Espera o elemento para clicar    ${dataFinalSubRelatorio}
    Espera o elemento para clicar    ${botaoOkCalendario}

Dado que acessei a seção de relatório de saídas
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de gerar relatórios
    Espera o elemento para clicar    ${botaoSaidasRelatorio}

Quando usuário acessar a seção de gerar relatórios
    Acessar Menu
    Acessar relatório

Quando executo a funcionalidade de gerar relatório em pdf
    Espera o elemento para clicar    ${gerarPDFSubRelatorio}

Quando executo a funcionalidade de gerar relatório em pdf sem preencher nenhuma data
    Quando executo a funcionalidade de gerar relatório em pdf

Então deve ser possível ver as informações e instruções sobre a seção de relatórios
    Wait Until Page Contains Element    ${telaRelatorio}
    Wait Until Page Contains Element    ${propagandaRelatorio}
    Checar se elementos estão visíveis    ${tituloRelatorio}    ${propagandaRelatorio}    ${botaoInventarioRelatorio}    ${botaoEntradasRelatorio}    ${botaoSaidasRelatorio}
    AppiumLibrary.Element Text Should Be    ${tituloRelatorio}    Relatórios
    AppiumLibrary.Element Text Should Be    ${botaoInventarioRelatorio}    INVENTÁRIO DE ESTOQUE
    AppiumLibrary.Element Text Should Be    ${botaoEntradasRelatorio}    ENTRADAS NO ESTOQUE
    AppiumLibrary.Element Text Should Be    ${botaoSaidasRelatorio}    SAÍDAS DO ESTOQUE
    Espera o elemento para clicar    ${botaoEntradasRelatorio}
    Wait Until Page Contains Element    ${tituloSubRelatorio}
    AppiumLibrary.Element Text Should Be    ${tituloSubRelatorio}    Entradas no estoque
    AppiumLibrary.Element Text Should Be    ${gerarPDFSubRelatorio}    GERAR PDF
    AppiumLibrary.Element Text Should Be    ${visualizarSubRelatorio}    VISUALIZAR PDF
    AppiumLibrary.Element Text Should Be    ${enviarSubRelatorio}    ENVIAR PDF
    AppiumLibrary.Element Text Should Be    ${dataInicioSubRelatorio}    Data inicial
    AppiumLibrary.Element Text Should Be    ${dataFinalSubRelatorio}    Data final

Então o PDF deve ser gerado
    [Arguments]    ${nomeArquivo}
    ${hoje}=    Pegar e formatar data atual
    Wait Until Keyword Succeeds    4    1    Element Should Contain Text    ${infoSubRelatorio}    ${nomeArquivo}
    Element Should Contain Text    ${infoSubRelatorio}    ${hoje}

E deve poder ser visualizado pelo celular
    Espera o elemento para clicar    ${visualizarSubRelatorio}
    Selecionar app deve estar visível

E deve poder ser enviado pelo celular
    [Arguments]    ${nomeRelatorio}
    Clicar para voltar no celular
    Espera o elemento para clicar    ${enviarSubRelatorio}
    Enviar para app deve estar visível
    AppiumLibrary.Element Text Should Be    ${celularTituloHeaderEnviar}    ${nomeRelatorio}

Então deve aparecer uma mensagem de erro ao gerar o relatório
    Wait Until Element Is Visible    ${mensagemErroSubRelatorio}
    AppiumLibrary.Element Text Should Be    ${mensagemErroSubRelatorio}    Por favor selecione um período de datas.