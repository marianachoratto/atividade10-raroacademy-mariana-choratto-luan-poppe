*** Settings ***
Resource    ../../base.robot
Library    String

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

*** Keywords ***
Dado que acessei a seção de backup
    Quando usuário acessar a seção de backup

Dado que já realizei um backup antes
    Quando usuário acessar a seção de backup
    Quando executar a funcinoalidade de gerar backup
    Espera o elemento para clicar    ${botaoOkMensagemSucessoBackup}
    ${temp}=    Get Text    ${infoUltimoBackup}
    @{lista}=    Split String    ${temp}    separator=${SPACE}-${SPACE}
    Log    ${lista}[0]
    Set Global Variable    ${backupCriado}    ${lista}[0]
    Clicar para voltar no celular

E que gerei um backup
    Quando executar a funcinoalidade de gerar backup
    Espera o elemento para clicar    ${botaoOkMensagemSucessoBackup}

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
    AppiumLibrary.Element Text Should Be    ${tituloBackup}    Gerar backup
    AppiumLibrary.Element Text Should Be    ${gerarBackup}    GERAR BACKUP
    AppiumLibrary.Element Text Should Be    ${botaoEnviarBackup}    ENVIAR
    AppiumLibrary.Element Text Should Be    ${textoBackup}    Envie o arquivo de backup para o drive virtual. Caso tenha problemas com seu aparelho seus dados poderão ser restaurados. Atenção, não altere o arquivo original, sob o risco de não conseguir restaurá-lo novamente.

Então o backup deve ser gerado com sucesso
    Wait Until Element Is Visible    ${tituloMensagemSucessoBackup}
    Element Should Be Visible    ${tituloMensagemSucessoBackup}
    Element Should Be Visible    ${textoMensagemSucessoBackup}
    Element Should Be Visible    ${botaoOkMensagemSucessoBackup}
    AppiumLibrary.Element Text Should Be    ${tituloMensagemSucessoBackup}    Operação concluída!
    AppiumLibrary.Element Text Should Be    ${textoMensagemSucessoBackup}    Enviar
    AppiumLibrary.Element Text Should Be    ${botaoOkMensagemSucessoBackup}    OK

Então o celular deverá mostrar opções de para onde enviar o backup
    Então o celular deverá mostrar opções de para onde enviar o arquivo