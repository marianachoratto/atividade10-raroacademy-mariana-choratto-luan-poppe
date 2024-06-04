
*** Settings ***

Resource    ../../base.robot

*** Variables ***
${celularEnviarBackupHeader}    xpath=//android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]
${celularEnviarBackupBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView
${celularTituloHeaderEnviar}    id=com.android.intentresolver:id/sem_chooser_main_title
${celularSelecionarAppHeader}    id=android:id/chooser_header
${celularSelecionarAppBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView
${botaoOkCalendario}    id=android:id/button1

*** Keywords ***
Clicar para voltar no celular
    Press Keycode    4

Então o celular deverá mostrar opções de para onde enviar o arquivo
    Wait Until Page Contains Element    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupBody}

Selecionar app deve estar visível
    Wait Until Page Contains Element    ${celularSelecionarAppHeader}
    Element Should Be Visible    ${celularSelecionarAppHeader}
    Element Should Be Visible    ${celularSelecionarAppBody}

Enviar para app deve estar visível
    Então o celular deverá mostrar opções de para onde enviar o arquivo