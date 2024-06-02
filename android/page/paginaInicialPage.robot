*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoNovo}            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${estoqueProduto}        xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"]
${botaoSaidaEstoque}     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]

# página de estoque
# ${pagEstoque}            xpath=//android.widget.ScrollView[@resource-id="br.com.pztec.estoque:id/scrollView1"]/android.widget.LinearLayout
# ${inputDiminuirEstoque}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdsaida"]
# ${inputMotivo}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_motivo"]
# ${inputDocReferencia}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_referencia"]

*** Keywords ***
Dado que acessei o aplicativo
    Wait Until Page Contains Element    ${botaoAceitarVersao}
    Espera o elemento para clicar    ${botaoAceitarVersao}

E tenho um estoque de produtos cadastrado
    E cadastrei um produto
    Wait Until Element Is Visible    ${estoqueProduto}

Quando cadastro uma saída de estoque
    Espera o elemento para clicar    ${botaoSaidaEstoque}
    Wait Until Element Is Visible    ${pagEstoque}
    Input Text    ${inputDiminuirEstoque}    1 
    Input Text    ${inputMotivo}    Venda de produto 
    Input Text    ${inputDocReferencia}    Venda de produto 
     