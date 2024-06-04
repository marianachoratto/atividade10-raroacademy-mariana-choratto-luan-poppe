*** Settings ***
Resource    ../../base.robot

*** Variables ***
${telaRestore}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloRestore}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${descricaoRestore}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/lbl_mensagem"]
${botaoSelecionarArquivoRestore}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_procurar"]
${telaEscolherPastaCelular}    xpath=/hierarchy/android.widget.FrameLayout
${pastaEstoqueCelular}    xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${mensagemSucessoTituloRestore}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${mensagemSucessoTextoRestore}    xpath=//android.widget.FrameLayout[@resource-id="android:id/contentPanel"]
${mensagemSucessoOKRestore}    xpath=//android.widget.Button[@resource-id="android:id/button1"]

*** Keywords ***
Confirmar operação de restauração
    Espera o elemento para clicar    xpath=//android.widget.Button[@resource-id="android:id/button1"]

E que acessei a seção de restore
    Acessar restore
Quando usuário acessar a seção de restore
    Dado que acessei o aplicativo
    Acessar Menu
    E que acessei a seção de restore

Quando executar a funcinoalidade de selecionar arquivo
    Wait Until Element Is Visible    ${botaoSelecionarArquivoRestore}
    Espera o elemento para clicar    ${botaoSelecionarArquivoRestore}

Então deve ser possível ver as informações e instruções sobre restore de backup
    Wait Until Page Contains Element    ${telaRestore}

    Checar se elementos estão visíveis    ${tituloRestore}    ${descricaoRestore}    ${botaoSelecionarArquivoRestore}
    AppiumLibrary.Element Text Should Be    ${tituloRestore}    Restaurar backup
    AppiumLibrary.Element Text Should Be    ${descricaoRestore}    Atenção: você só deve executar esta operação caso tenha trocado de aparelho ou reinstalado o aplicativo.
    AppiumLibrary.Element Text Should Be    ${botaoSelecionarArquivoRestore}    SELECIONAR ARQUIVO

Então deve ser possível restaurar um backup a partir do backup previamente criado
    Wait Until Page Contains Element    ${telaEscolherPastaCelular}
    Swipe para cima Y
    Espera o elemento para clicar    ${pastaEstoqueCelular}
    ${texto}=    Get Substring    ${backupCriado}    0    -1
    Click Text    ${texto}
    Checar se elementos estão visíveis    ${mensagemSucessoTituloRestore}    ${mensagemSucessoTextoRestore}    ${mensagemSucessoOKRestore}