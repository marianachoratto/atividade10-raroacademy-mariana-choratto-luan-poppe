*** Settings ***
Resource    ../../base.robot

*** Variables ***
${telaBackup}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloBackup}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${propagandaBackup}    xpath=//android.webkit.WebView
${gerarBackup}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${botaoEnviarBackup}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_send"]
${textoBackup}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${infoUltimoBackup}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafile"]
${tituloMensagemSucessoBackup}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${textoMensagemSucessoBackup}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
${botaoOkMensagemSucessoBackup}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${celularEnviarBackupHeader}    xpath=//android.widget.RelativeLayout[@resource-id="android:id/chooser_header"]
${celularEnviarBackupBody}    xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView

*** Keywords ***
Dado que acessei a seção de backup
    Quando usuário acessar a seção de backup
Quando usuário acessar a seção de backup
    Dado que acessei o aplicativo
    Acessar Menu
    Acessar backup

Quando executar a funcinoalidade de gerar backup
    Espera o elemento para clicar    ${gerarBackup}

Quando executar a funcinoalidade de enviar backup
    Espera o elemento para clicar    ${botaoEnviarBackup}

Então deve ser possível ver as informações e instruções sobre backup
    Wait Until Page Contains Element    ${telaBackup}

    Element Should Be Visible    ${tituloBackup}
    Wait Until Keyword Succeeds    4    1    Element Should Be Visible    ${propagandaBackup}
    Element Should Be Visible    ${gerarBackup}
    Element Should Be Visible    ${botaoEnviarBackup}
    Element Should Be Visible    ${textoBackup}
    Element Text Should Be    ${tituloBackup}    Gerar backup
    Element Text Should Be    ${gerarBackup}    GERAR BACKUP
    Element Text Should Be    ${botaoEnviarBackup}    ENVIAR

Então o backup deve ser gerado com sucesso
    Wait Until Element Is Visible    ${tituloMensagemSucessoBackup}
    Element Should Be Visible    ${tituloMensagemSucessoBackup}
    Element Should Be Visible    ${textoMensagemSucessoBackup}
    Element Should Be Visible    ${botaoOkMensagemSucessoBackup}
    Element Text Should Be    ${tituloMensagemSucessoBackup}    Operação concluída!
    Element Text Should Be    ${textoMensagemSucessoBackup}    Enviar
    Element Text Should Be    ${botaoOkMensagemSucessoBackup}    OK

Então o celular deverá mostrar opções de para onde enviar o backup
    Wait Until Page Contains Element    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupHeader}
    Element Should Be Visible    ${celularEnviarBackupBody}