*** Settings ***
Resource    ../../base.robot
Resource    ../../config-celular.robot


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
# As configurações diferentes do celular do outro integrante da dupla se encontram no arquivo config-celular.robot
# ${APPIUM:APP}    D:\\Users\\Mariana Choratto\\Documents\\Mariana\\Programação\\Raro\\Exercicios pontuados\\atividade10-raroacademy-mariana-choratto-luan-poppe\\product_registration.apk
# ${APPIUM:UDID}    RXCT702F7XT
${ANDROID_PLATFORM_NAME}    Android

*** Keywords ***
Abrir App
    Open Application    ${APPIUM:URL}    autoGrantPermissions=${True}    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}     AppiumUdid=${APPIUM:UDID}    app=${APPIUM:APP}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications