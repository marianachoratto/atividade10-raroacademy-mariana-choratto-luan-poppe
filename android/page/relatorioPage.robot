*** Settings ***
Resource    ../../base.robot

*** Variables ***
${telaRelatorio}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloRelatorio}    id=br.com.pztec.estoque:id/lbl_titulo
${propagandaRelatorio}    id=br.com.pztec.estoque:id/adView_relat
${botaoInventarioRelatorio}    id=br.com.pztec.estoque:id/inventario
${botaoEntradasRelatorio}    id=br.com.pztec.estoque:id/relentrada
${botaoSaidasRelatorio}    id=br.com.pztec.estoque:id/relsaida

*** Keywords ***
Quando usuário acessar a seção de gerar relatórios
    Acessar Menu
    Acessar relatório

Então deve ser possível ver as informações e instruções sobre a seção de relatórios
    Wait Until Page Contains Element    ${telaRelatorio}
    Wait Until Page Contains Element    ${propagandaRelatorio}
    Checar se elementos estão visíveis    ${tituloRelatorio}    ${propagandaRelatorio}    ${botaoInventarioRelatorio}    ${botaoEntradasRelatorio}    ${botaoSaidasRelatorio}