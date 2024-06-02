*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoGrupoDeProdutos}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_grupo"]
${botaoRelatorio}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_relatorios"]
${botaoBackup}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_backup"]
${botaoRestore}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_restore"]
${botaoExportarDados}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_exportar"]
${botaoImportarDados}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_importar"]
${botaoESEstoque}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_movmto"]
${botaoIndicarApp}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_share"]
${botaoAjuda}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_ajuda"]
${botaoNovoApp}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_vejamais"]

*** Keywords ***

Acessar backup
    Espera o elemento para clicar    ${botaoBackup}

Acessar restore
    Espera o elemento para clicar    ${botaoRestore}

Acessar exportar dados
    Espera o elemento para clicar    ${botaoExportarDados}
Acessar importar dados
    Espera o elemento para clicar    ${botaoImportarDados}