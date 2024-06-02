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
${historicoExportacaoTexto1}    xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileprod"]
${botaoEnviarExportacao1}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_prod"]
@{listaHistoricoExportar}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.LinearLayout/android.widget.LinearLayout

*** Keywords ***
E que acessei a seção de exportar dados
    # Dado que acessei o aplicativo
    Quando usuário acessar a seção de exportar dados

E realizei a exportação de dados
    E que acessei a seção de exportar dados
    Quando executo a funcionalidade de exportar dados
    Espera o elemento para clicar    ${mensagemSucessoOKExportar}

Quando usuário acessar a seção de exportar dados
    Acessar Menu
    Acessar exportar dados

Quando executo a funcionalidade de exportar dados
    Espera o elemento para clicar    ${botaoExportarDadosExportar}

Quando acesso a funcionalidade de enviar os dados exportados
    Wait Until Page Contains Element    ${botaoEnviarExportacao1}
    Espera o elemento para clicar    ${botaoEnviarExportacao1}

# Quando acesso a funcionalidade de enviar os dados exportados sem ter exportado dados previamente

Então deve ser possível ver as informações e instruções sobre exportação de dados
    Wait Until Page Contains Element    ${telaExportar}
    Wait Until Page Contains Element    ${propagandaExportar}
    Checar se elementos estão visíveis    ${tituloExportar}    ${descricaoExportar}    ${botaoExportarDadosExportar}    ${propagandaExportar}

Então deve ser possível ver uma mensagem de sucesso da exportação
    Wait Until Page Contains Element    ${mensagemSucessoTituloExportar}
    Checar se elementos estão visíveis    ${mensagemSucessoTituloExportar}    ${mensagemSucessoDescricaoExportar}    ${mensagemSucessoOKExportar}

E deve ser possível ver a exportação realizada na lista de exportações
    Espera o elemento para clicar    ${mensagemSucessoOKExportar}
    ${hoje}=    Pegar e formatar data atual
    Element Should Contain Text    ${historicoExportacaoTexto1}    ${hoje}

Então o celular deverá mostrar opções de para onde enviar o arquivo exportado
    Então o celular deverá mostrar opções de para onde enviar o arquivo