*** Settings ***
Resource    ../../base.robot
Library    XML

*** Variables ***
${adicionarGrupoProdutos}       id=br.com.pztec.estoque:id/addgrupo
${campoNomeGrupoProdutos}       id=br.com.pztec.estoque:id/txt_descricao
${botaoSalvarGrupoProdutos}     id=br.com.pztec.estoque:id/btn_salvar

*** Keywords ***

# Acho que pode apagar essa página. Não era pra fazer
Dado que realizei uma alteração nos grupos de produtos
    Dado que acessei o aplicativo
    E que realizei uma alteração nos grupos de produtos

E que realizei uma alteração nos grupos de produtos
    Acessar Menu
    Acessar grupo de produtos
    Espera o elemento para clicar    ${adicionarGrupoProdutos}
    Input Text    ${campoNomeGrupoProdutos}    Nome do Grupo
    Espera o elemento para clicar    ${botaoSalvarGrupoProdutos}
    Clicar para voltar no celular
    Clicar para voltar no celular