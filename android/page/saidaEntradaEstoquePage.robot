*** Settings ***
Resource    ../../base.robot

*** Variables ***
${pagEstoque}            xpath=//android.widget.ScrollView[@resource-id="br.com.pztec.estoque:id/scrollView1"]/android.widget.LinearLayout
${inputDiminuirEstoque}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdsaida"]
${inputMotivo}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_motivo"]
${inputDocReferencia}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_referencia"]