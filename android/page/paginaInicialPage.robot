*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}    xpath=//android.widget.Button[@resource-id="android:id/button1"]


*** Keywords ***
Dado que acessei o aplicativo
    Espera o elemento para clicar    ${botaoAceitarVersao}