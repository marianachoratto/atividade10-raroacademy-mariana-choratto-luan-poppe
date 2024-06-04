
*** Settings ***

Resource    ../../base.robot

*** Variables ***
${celularEnviarArquivoHeader}    xpath=//android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]
${celularEnviarArquivoBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView
${celularTituloHeaderEnviar}    id=com.android.intentresolver:id/sem_chooser_main_title
${celularSelecionarAppHeader}    id=android:id/chooser_header
${celularSelecionarAppBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView
${botaoOkCalendario}    id=android:id/button1

*** Keywords ***
Clicar para voltar no celular
    Press Keycode    4

Clicar enter no celular
    Press Keycode    66

Então o celular deverá mostrar opções de para onde enviar o arquivo
    Wait Until Page Contains Element    ${celularEnviarArquivoHeader}
    Checar se elementos estão visíveis    ${celularEnviarArquivoHeader}    ${celularEnviarArquivoBody}

Selecionar app deve estar visível
    Wait Until Page Contains Element    ${celularSelecionarAppHeader}
    Checar se elementos estão visíveis    ${celularSelecionarAppHeader}    ${celularSelecionarAppBody}

Enviar para app deve estar visível
    Então o celular deverá mostrar opções de para onde enviar o arquivo