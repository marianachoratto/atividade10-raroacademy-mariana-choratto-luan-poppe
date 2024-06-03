*** Settings ***
Resource    ../../base.robot
Library    XML

*** Variables ***
${tituloImportacao}    xpath=//android.widget.TextView[@text="Importar dados"]
${botaoRestaurarProdutosImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_produtos"]
${botaoRestaurarEntradasImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_entradas"]
${botaoRestaurarSaidasImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_saidas"]
${botaoRestaurarGruposImportacao}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupos"]
${mensagemRestaurarProdutosTitulo}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${mensagemRestaurarProdutosDescricao}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
${mensagemRestaurarProdutosBotaoSim}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${mensagemRegistrosRestauradosTitulo}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${mensagemRegistrosRestauradosDescricao}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
${mensagemRegistrosRestauradosOK}    xpath=//android.widget.Button[@resource-id="android:id/button1"]


*** Keywords ***
Selecionar importação
    [Arguments]    ${arquivoSelecionado}
    Wait Until Page Contains Element    ${telaEscolherPastaCelular}
    Swipe para cima Y
    Espera o elemento para clicar    ${pastaEstoqueCelular}
    Click Text    ${arquivoSelecionado}

Quando usuário acessar a seção de importar dados
    Acessar Menu
    Acessar importar dados

E acessei a seção de importar dados
    Quando usuário acessar a seção de importar dados

E acessei a seção de importação
    Quando usuário acessar a seção de importar dados

Quando executo a funcionalidade de restaurar produtos
    Espera o elemento para clicar    ${botaoRestaurarProdutosImportacao}

Quando executo a funcionalidade de restaurar entradas
    Espera o elemento para clicar    ${botaoRestaurarEntradasImportacao}

Então deve ser possível ver as informações e instruções sobre importação de dados
    Checar se elementos estão visíveis    ${tituloImportacao}    ${botaoRestaurarProdutosImportacao}    ${botaoRestaurarEntradasImportacao}    ${botaoRestaurarSaidasImportacao}    ${botaoRestaurarGruposImportacao}

Então deve ser possível restaurar dados de produtos a partir de exportações realizadas previamente
    Selecionar importação    produtos.csv
    Checar se elementos estão visíveis    ${mensagemRestaurarProdutosTitulo}    ${mensagemRestaurarProdutosDescricao}    ${mensagemRestaurarProdutosBotaoSim}
    Element Text Should Be    ${mensagemRestaurarProdutosTitulo}    ATENÇÃO
    Element Text Should Be    ${mensagemRestaurarProdutosDescricao}    Todos os produtos existentes no cadastro (se houver) serão excluídos e 1 produtos do arquivo CSV serão importados. Tem certeza que deseja executar? Você não poderá desfazer esta operação.
    Espera o elemento para clicar    ${mensagemRestaurarProdutosBotaoSim}
    Checar se elementos estão visíveis    ${mensagemRegistrosRestauradosTitulo}    ${mensagemRegistrosRestauradosDescricao}    ${mensagemRegistrosRestauradosOK}
    Element Text Should Be    ${mensagemRegistrosRestauradosTitulo}    Mensagem
    Element Text Should Be    ${mensagemRegistrosRestauradosDescricao}    1 registros inseridos.
    Espera o elemento para clicar    ${mensagemRegistrosRestauradosOK}

Então deve ser possível restaurar dados de entradas a partir de exportações realizadas previamente
    Selecionar importação    entradas.csv

E o produto restaurado deve se encontrar na página de produtos
    Clicar para voltar no celular
    Clicar para voltar no celular
    Então deve ser possível ver as informações sobre os produtos cadastrados