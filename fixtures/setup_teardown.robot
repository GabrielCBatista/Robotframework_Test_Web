*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}             chrome

*** Keywords ***
Inicio
    [Documentation]    Opens the browser, maximizes it and logs in to the website
    Open Browser        about:blank    ${BROWSER}
    Maximize Browser Window

Fim
    [Documentation]    Closes the browser
    Close Browser
