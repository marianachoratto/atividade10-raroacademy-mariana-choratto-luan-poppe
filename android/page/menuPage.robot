*** Settings ***
Resource    ../../base.robot

*** Variables ***
${botaoGrupoDeProdutos}    id=br.com.pztec.estoque:id/btn_grupo
${botaoRelatorio}          id=br.com.pztec.estoque:id/btn_relatorios
${botaoBackup}             id=br.com.pztec.estoque:id/btn_backup
${botaoRestore}            id=br.com.pztec.estoque:id/btn_restore
${botaoExportarDados}      id=br.com.pztec.estoque:id/btn_exportar
${botaoImportarDados}      id=br.com.pztec.estoque:id/btn_importar
${botaoESEstoque}          id=br.com.pztec.estoque:id/btn_movmto
${botaoIndicarApp}         id=br.com.pztec.estoque:id/btn_share
${botaoAjuda}              id=br.com.pztec.estoque:id/btn_ajuda
${botaoNovoApp}            id=br.com.pztec.estoque:id/btn_vejamais

*** Keywords ***

Acessar backup
    Espera o elemento para clicar    ${botaoBackup}

Acessar restore
    Espera o elemento para clicar    ${botaoRestore}

Acessar exportar dados
    Espera o elemento para clicar    ${botaoExportarDados}
Acessar importar dados
    Espera o elemento para clicar    ${botaoImportarDados}

Acessar grupo de produtos
    Espera o elemento para clicar    ${botaoGrupoDeProdutos}

Acessar relatório
    Espera o elemento para clicar    ${botaoRelatorio}