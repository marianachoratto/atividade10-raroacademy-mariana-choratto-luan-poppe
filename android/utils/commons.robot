*** Settings ***
Library    DateTime

Resource    ../../base.robot

*** Keywords ***
Espera o elemento para clicar
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element                    ${elemento}

Espera o elemento para fazer o inputtext
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible    ${elemento}
    Input Text                       ${elemento}    ${texto}

Swipe para esquerda X
    [Arguments]    ${valorXFinal}=20    ${valorY}=20    ${valorXInicial}=70
    Swipe By Percent    ${valorXInicial}    ${valorY}    ${valorXFinal}    ${valorY}

Swipe para cima Y
    [Arguments]    ${valorYFinal}=20    ${valorX}=20    ${valorYInicial}=75
    Swipe By Percent    ${valorX}    ${valorYInicial}    ${valorX}    ${valorYFinal}

Checar se elementos estão habilitados
    [Arguments]    @{elementos}
    FOR    ${elemento}    IN    @{elementos}
        ${attr}    AppiumLibrary.Get Element Attribute    ${elemento}    enabled
        Should Be Equal    ${attr}    true
    END

Checar se elementos estão visíveis
    [Arguments]    @{elementos}
    FOR    ${elemento}    IN    @{elementos}
        Element Should Be Visible    ${elemento}
    END

Checar se elementos estão habilitados e visíveis
    [Arguments]    @{elementos}
    Checar se elementos estão habilitados    @{elementos}
    Checar se elementos estão visíveis    @{elementos}

Pegar e formatar data atual
    Run Keyword And Return    Get Current Date    result_format=%d/%m/%Y

Então o produto não deve ser cadastrado
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Element Should Be Enabled    ${elemento}
    Element Text Should Be    ${elemento}    ${EMPTY}
    Clicar para voltar no celular
    Clicar para voltar no celular
    Page Should Not Contain Element    ${cardEstoqueProduto}

Espera o elemento e checa o texto
    [Arguments]    ${elemento}    ${texto}
    Wait Until Page Contains Element    ${elemento}
    Page Should Contain Text    ${texto}

