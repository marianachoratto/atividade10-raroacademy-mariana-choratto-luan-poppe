*** Settings ***
Resource    ../../base.robot
Library    XML

*** Variables ***
${telaExportar}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout
${tituloExportar}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${descricaoExportar}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${botaoExportarDadosExportar}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${propagandaExportar}    xpath=//android.view.ViewGroup[@resource-id="br.com.pztec.estoque:id/adView_exportar"]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.widget.TextView
${mensagemErroPDFNaoGerado}    xpath=//android.widget.Toast[@text="O arquivo PDF ainda não foi gerado!"]
${mensagemSucessoTituloExportar}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${mensagemSucessoDescricaoExportar}    xpath=//android.widget.TextView[@resource-id="android:id/message"]
${mensagemSucessoOKExportar}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${historicoExportacaoTextoProduto}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileprod"]
${botaoEnviarExportacaoProduto}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_prod"]
${historicoExportacaoTextoEntrada}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileent"]
${botaoEnviarExportacaoEntrada}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_ent"]
${historicoExportacaoTextoSaida}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilesai"]
${botaoEnviarExportacaoSaida}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_sai"]
${historicoExportacaoTextoGrupos}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilegrupo"]
${botaoEnviarExportacaoGrupos}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupo"]


@{listaHistoricoExportar}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout/android.widget.LinearLayout

*** Keywords ***
Checar data da exportação
    [Arguments]    ${elementoTestado}
    ${hoje}=    Pegar e formatar data atual
    Element Should Contain Text    ${elementoTestado}    ${hoje}



E que acessei a seção de exportar dados
    # Dado que acessei o aplicativo
    Quando usuário acessar a seção de exportar dados

E realizei a exportação de dados
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Espera o elemento para clicar    ${mensagemSucessoOKExportar}

Dado que realizei uma entrada de algum produto
    Dado que realizei o cadastro de um produto
    Quando cadastro uma entrada de estoque

Dado que realizei uma saída de algum produto
    Wait Until Keyword Succeeds    4    1    Dado que realizei o cadastro de um produto
    Quando cadastro uma saída de estoque

Quando usuário acessar a seção de exportar dados
    Acessar Menu
    Acessar exportar dados

Quando executo a funcionalidade de exportar dados
    Espera o elemento para clicar    ${botaoExportarDadosExportar}

Quando acesso a funcionalidade de enviar os dados exportados de produtos
    Wait Until Page Contains Element    ${botaoEnviarExportacaoProduto}
    Espera o elemento para clicar    ${botaoEnviarExportacaoProduto}

Quando acesso a funcionalidade de enviar os dados exportados de entradas
    Wait Until Page Contains Element    ${historicoExportacaoTextoEntrada}
    Espera o elemento para clicar    ${botaoEnviarExportacaoEntrada}

Quando acesso a funcionalidade de enviar os dados exportados de saídas
    Wait Until Page Contains Element    ${historicoExportacaoTextoSaida}
    Espera o elemento para clicar    ${botaoEnviarExportacaoSaida}

Quando acesso a funcionalidade de enviar os dados exportados de grupos
    Wait Until Page Contains Element    ${historicoExportacaoTextoGrupos}
    Espera o elemento para clicar    ${botaoEnviarExportacaoGrupos}


# Quando acesso a funcionalidade de enviar os dados exportados sem ter exportado dados previamente

Então deve ser possível ver as informações e instruções sobre exportação de dados
    Wait Until Page Contains Element    ${telaExportar}
    Wait Until Page Contains Element    ${propagandaExportar}
    Checar se elementos estão visíveis    ${tituloExportar}    ${descricaoExportar}    ${botaoExportarDadosExportar}    ${propagandaExportar}

Então deve ser possível ver uma mensagem de sucesso da exportação
    Wait Until Page Contains Element    ${mensagemSucessoTituloExportar}
    Checar se elementos estão visíveis    ${mensagemSucessoTituloExportar}    ${mensagemSucessoDescricaoExportar}    ${mensagemSucessoOKExportar}

E deve ser possível ver a exportação realizada na lista de exportações
    [Arguments]    ${elementoChecado}
    Espera o elemento para clicar    ${mensagemSucessoOKExportar}
    Checar data da exportação    ${elementoChecado}

Então o celular deverá mostrar opções de para onde enviar o arquivo exportado
    Então o celular deverá mostrar opções de para onde enviar o arquivo

Então deverá ser possível a mensagem de erro
    Page Should Contain Element    ${mensagemErroPDFNaoGerado}
    # Element Should Be Visible    ${mensagemErroPDFNaoGerado}