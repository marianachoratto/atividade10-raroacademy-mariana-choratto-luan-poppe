*** Settings ***

Library    AppiumLibrary

Resource    android/utils/commons.robot
Resource    android/utils/celularInteraction.robot
Resource    android/utils/config.robot

# Page Objects
Resource    android/page/paginaInicialPage.robot
Resource    android/page/cadastroPage.robot
Resource    android/page/menuPage.robot
Resource    android/page/backupPage.robot
Resource    android/page/restorePage.robot
Resource    android/page/saidaEntradaEstoquePage.robot
Resource    android/page/exportarDadosPage.robot
Resource    android/page/grupoDeProdutosPage.robot
Resource    android/page/importacaoDadosPage.robot
Resource    android/page/relatorioPage.robot