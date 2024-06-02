
*** Settings ***

Resource    ../../base.robot

*** Variables ***
${celularEnviarBackupHeader}    xpath=//android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]
${celularEnviarBackupBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView

*** Keywords ***
Clicar para voltar no celular
    Press Keycode    4

Então o celular deverá mostrar opções de para onde enviar o arquivo
    Wait Until Page Contains Element    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupBody}