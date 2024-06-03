*** Settings ***
Resource    ../../base.robot
Library    XML

*** Variables ***
${adicionarGrupoProdutos}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/addgrupo"]
${campoNomeGrupoProdutos}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${botaoSalvarGrupoProdutos}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]

*** Keywords ***
Dado que realizei uma alteração nos grupos de produtos
    Dado que acessei o aplicativo
    E que realizei uma alteração nos grupos de produtos

E que realizei uma alteração nos grupos de produtos
    Acessar Menu
    Acessar grupo de produtos
    Espera o elemento para clicar    ${adicionarGrupoProdutos}
    Espera o elemento para fazer o inputtext    ${campoNomeGrupoProdutos}    Nome do Grupo
    Espera o elemento para clicar    ${botaoSalvarGrupoProdutos}
    Clicar para voltar no celular
    Clicar para voltar no celular