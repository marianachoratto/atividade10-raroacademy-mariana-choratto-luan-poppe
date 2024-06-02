*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${botaoMenu}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]

*** Keywords ***
Dado que acessei o aplicativo
    Espera o elemento para clicar    ${botaoAceitarVersao}

Acessar Menu
    Espera o elemento para clicar    ${botaoMenu}