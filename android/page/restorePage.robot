*** Settings ***
Resource    ../../base.robot

*** Variables ***
${tituloRestore}                    id=br.com.pztec.estoque:id/textView3
${descricaoRestore}                 id=br.com.pztec.estoque:id/lbl_mensagem
${mensagemSucessoTituloRestore}     id=android:id/alertTitle
${mensagemSucessoOKRestore}         id=android:id/button1
${botaoSelecionarArquivoRestore}    id=br.com.pztec.estoque:id/btn_procurar


${mensagemSucessoTextoRestore}      xpath=//android.widget.FrameLayout[@resource-id="android:id/contentPanel"]
${telaEscolherPastaCelular}         xpath=/hierarchy/android.widget.FrameLayout
${pastaEstoqueCelular}              xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${telaRestore}                      xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout

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

    Element Should Be Visible    ${tituloRestore}
    Element Should Be Visible    ${descricaoRestore}
    Element Should Be Visible    ${botaoSelecionarArquivoRestore}
    Element Text Should Be    ${tituloRestore}    Restaurar backup
    Element Text Should Be    ${descricaoRestore}    Atenção: você só deve executar esta operação caso tenha trocado de aparelho ou reinstalado o aplicativo.
    Element Text Should Be    ${botaoSelecionarArquivoRestore}    SELECIONAR ARQUIVO

Então deve ser possível restaurar um backup a partir do backup previamente criado
    Wait Until Page Contains Element    ${telaEscolherPastaCelular}
    Swipe para cima Y
    Espera o elemento para clicar    ${pastaEstoqueCelular}
    ${texto}=    Get Substring    ${backupCriado}    0    -1
    Click Text    ${texto}
    Checar se elementos estão visíveis    ${mensagemSucessoTituloRestore}    ${mensagemSucessoTextoRestore}    ${mensagemSucessoOKRestore}