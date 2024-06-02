*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${botaoMenu}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]


${botaoSaidaEstoque}     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${botaoEntradaEstoque}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]


# card do produto
${estoqueProduto}        xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"]
${tabela_quantidade}     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]

*** Keywords ***
Dado que acessei o aplicativo
    Wait Until Page Contains Element    ${botaoAceitarVersao}
    Espera o elemento para clicar    ${botaoAceitarVersao}

Acessar Menu
    Espera o elemento para clicar    ${botaoMenu}
