*** Settings ***
Resource    ../../base.robot

*** Variables ***
${telaRestore}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloRestore}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${descricaoRestore}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/lbl_mensagem"]
${botaoSelecionarArquivoRestore}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_procurar"]
${telaEscolherPastaCelular}    xpath=/hierarchy/android.widget.FrameLayout
${pastaEstoqueCelular}    xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]

*** Keywords ***
Dado que acessei a seção de restore
    Quando usuário acessar a seção de restore
Quando usuário acessar a seção de restore
    Dado que acessei o aplicativo
    Acessar Menu
    Acessar restore

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

Então deve ser possível selecionar um arquivo da pasta onde os backups são guardados
    Wait Until Page Contains Element    ${telaEscolherPastaCelular}
    Swipe para cima Y
    Espera o elemento para clicar    ${pastaEstoqueCelular}

# Então o backup deve ser gerado com sucesso
#     Wait Until Element Is Visible    ${tituloMensagemSucessoBackup}
#     Element Should Be Visible    ${tituloMensagemSucessoBackup}
#     Element Should Be Visible    ${textoMensagemSucessoBackup}
#     Element Should Be Visible    ${botaoOkMensagemSucessoBackup}
#     Element Text Should Be    ${tituloMensagemSucessoBackup}    Operação concluída!
#     Element Text Should Be    ${textoMensagemSucessoBackup}    Enviar
#     Element Text Should Be    ${botaoOkMensagemSucessoBackup}    OK

# Então o celular deverá mostrar opções de para onde enviar o backup
#     Wait Until Page Contains Element    ${celularEnviarBackupHeader}
#     Element Should Be Visible    ${celularEnviarBackupHeader}
#     Element Should Be Visible    ${celularEnviarBackupBody}