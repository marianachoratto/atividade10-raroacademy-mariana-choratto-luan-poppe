*** Settings ***
Resource    ../../base.robot
Resource    ../../config-celular.robot


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${APPIUM:APP}    
# ${APPIUM:UDID}    RXCT702F7XT
${ANDROID_PLATFORM_NAME}    Android

*** Keywords ***
Abrir App
    Open Application    ${APPIUM:URL}    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}     AppiumUdid=${APPIUM:UDID}    app=${APPIUM:APP}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications