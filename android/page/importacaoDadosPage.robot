*** Settings ***
Resource    ../../base.robot
Library    XML

*** Variables ***
${botaoRestaurarProdutosImportacao}          id=br.com.pztec.estoque:id/btn_produtos
${botaoRestaurarEntradasImportacao}          id=br.com.pztec.estoque:id/btn_entradas
${botaoRestaurarSaidasImportacao}            id=br.com.pztec.estoque:id/btn_saidas
${botaoRestaurarGruposImportacao}            id=br.com.pztec.estoque:id/btn_grupos
${mensagemRestaurarProdutosBotaoSim}         id=android:id/button1
${mensagemRegistrosRestauradosOK}            id=android:id/button1
${tituloImportacao}                          xpath=//android.widget.TextView[@text="Importar dados"]
${mensagemRestaurarProdutosTitulo}           id=android:id/alertTitle
${mensagemRestaurarProdutosDescricao}        id=android:id/message
${mensagemRegistrosRestauradosTitulo}        id=android:id/alertTitle
${mensagemRegistrosRestauradosDescricao}     id=android:id/message

# XPATHS ORIGINAIS
# ${tituloImportacao}    xpath=//android.widget.TextView[@text="Importar dados"]
# ${botaoRestaurarProdutosImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_produtos"]
# ${botaoRestaurarEntradasImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_entradas"]
# ${botaoRestaurarSaidasImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_saidas"]
# ${botaoRestaurarGruposImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupos"]

# ${mensagemRestaurarTitulo}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
# ${mensagemRestaurarDescricao}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
# ${mensagemRestaurarBotaoSim}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
# ${mensagemRegistrosRestauradosTitulo}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
# ${mensagemRegistrosRestauradosDescricao}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
# ${mensagemRegistrosRestauradosOK}    xpath=//android.widget.Button[@resource-id="android:id/button1"]

*** Keywords ***
Selecionar importação
    [Arguments]    ${arquivoSelecionado}    ${mensagemDescricao}
    Wait Until Page Contains Element    ${telaEscolherPastaCelular}
    Swipe para cima Y
    Espera o elemento para clicar    ${pastaEstoqueCelular}
    Click Text    ${arquivoSelecionado}
    Checar se elementos estão visíveis    ${mensagemRestaurarProdutosTitulo}    ${mensagemRestaurarProdutosDescricao}    ${mensagemRestaurarProdutosBotaoSim}
    AppiumLibrary.Element Text Should Be    ${mensagemRestaurarProdutosTitulo}    ATENÇÃO
    AppiumLibrary.Element Text Should Be    ${mensagemRestaurarProdutosDescricao}    ${mensagemDescricao}
    Espera o elemento para clicar    ${mensagemRestaurarProdutosBotaoSim}
    Checar se elementos estão visíveis    ${mensagemRegistrosRestauradosTitulo}    ${mensagemRegistrosRestauradosDescricao}    ${mensagemRegistrosRestauradosOK}
    

Mensagem de importação bem sucedida
    [Arguments]    ${tituloMensagem}    ${descricaoMensagem}
    AppiumLibrary.Element Text Should Be    ${mensagemRegistrosRestauradosTitulo}    ${tituloMensagem}
    AppiumLibrary.Element Text Should Be    ${mensagemRegistrosRestauradosDescricao}    ${descricaoMensagem}
    Espera o elemento para clicar    ${mensagemRegistrosRestauradosOK}
Quando usuário acessar a seção de importar dados
    Acessar Menu
    Acessar importar dados

E acessei a seção de importar dados
    Quando usuário acessar a seção de importar dados

Quando executo a funcionalidade de restaurar produtos
    Espera o elemento para clicar    ${botaoRestaurarProdutosImportacao}

Quando executo a funcionalidade de restaurar entradas
    Espera o elemento para clicar    ${botaoRestaurarEntradasImportacao}

Quando executo a funcionalidade de restaurar saídas
    Espera o elemento para clicar    ${botaoRestaurarSaidasImportacao}

Quando executo a funcionalidade de restaurar grupos
    Espera o elemento para clicar    ${botaoRestaurarGruposImportacao}

Então deve ser possível ver as informações e instruções sobre importação de dados
    Wait Until Keyword Succeeds    4    1    Checar se elementos estão visíveis    ${tituloImportacao}    ${botaoRestaurarProdutosImportacao}    ${botaoRestaurarEntradasImportacao}    ${botaoRestaurarSaidasImportacao}    ${botaoRestaurarGruposImportacao}

Então deve ser possível restaurar dados de produtos a partir de exportações realizadas previamente
    Selecionar importação    produtos.csv    Todos os produtos existentes no cadastro (se houver) serão excluídos e 1 produtos do arquivo CSV serão importados. Tem certeza que deseja executar? Você não poderá desfazer esta operação.
    Mensagem de importação bem sucedida    Mensagem    1 registros inseridos.

Então deve ser possível restaurar dados de entradas a partir de exportações realizadas previamente
    Selecionar importação    entradas.csv    Todos as entradas cadastradas (se houver) serão excluídas e 1 entradas do arquivo CSV serão importadas. Tem certeza que deseja executar? Você não poderá desfazer esta operação.
    Mensagem de importação bem sucedida    Operação concluída!    1 registros inseridos.

Então deve ser possível restaurar dados de saídas a partir de exportações realizadas previamente
    Selecionar importação    saidas.csv    Todos as saídas cadastradas (se houver) serão excluídas e 1 saídas do arquivo CSV serão importadas. Tem certeza que deseja executar? Você não poderá desfazer esta operação.
    Mensagem de importação bem sucedida    Operação concluída!    1 registros inseridos.

Então deve ser possível restaurar dados de grupos a partir de exportações realizadas previamente
    Selecionar importação    grupos.csv    Todos os grupos cadastrados (se houver) serão excluídos e 2 grupos do arquivo CSV serão importados. Tem certeza que deseja executar? Você não poderá desfazer esta operação.
    Mensagem de importação bem sucedida    Operação concluída!    2 registros inseridos.

E o produto restaurado deve se encontrar na página de produtos
    Clicar para voltar no celular
    Clicar para voltar no celular
    Então deve ser possível ver as informações sobre os produtos cadastrados