*** Settings ***
Resource    ../../base.robot

*** Variables ***
${pagEstoque}                xpath=//android.widget.ScrollView[@resource-id="br.com.pztec.estoque:id/scrollView1"]/android.widget.LinearLayout
${inputDiminuirEstoque}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdsaida"]
${inputMotivo}                xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_motivo"]
${inputDocReferencia}         xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_referencia"]
${botaoSalvarSaida}            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]
${inputAdicionarEstoque}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdentrada"]


*** Keywords ***
E tenho um estoque de produtos cadastrado
    E cadastrei um produto
    Wait Until Element Is Visible    ${estoqueProduto}

Quando cadastro uma saída de estoque
    Espera o elemento para clicar    ${botaoSaidaEstoque}
    Wait Until Element Is Visible    ${pagEstoque}
    Input Text    ${inputDiminuirEstoque}    1 
    Input Text    ${inputMotivo}    Venda de produto 
    Input Text    ${inputDocReferencia}    Nota Fiscal #01
    Espera o elemento para clicar    ${botaoSalvarSaida}

Então posso ver na página inicial que houve uma diminuição no estoque
    Wait Until Element Is Visible    ${estoqueProduto}
    Element Should Contain Text    ${tabela_quantidade}    49.0

Quando cadastro uma entrada de estoque
    Espera o elemento para clicar    ${botaoEntradaEstoque}
    Wait Until Element Is Visible    ${pagEstoque}
    Input Text    ${inputAdicionarEstoque}    10 
    Input Text    ${inputMotivo}    Compra de lote de produto 
    Input Text    ${inputDocReferencia}    Nota Fiscal #02
    Espera o elemento para clicar    ${botaoSalvarSaida}

Então posso ver na página inicial que houve um aumento no estoque
    Wait Until Element Is Visible    ${estoqueProduto}
    Element Should Contain Text    ${tabela_quantidade}    60.0