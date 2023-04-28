*** Settings ***
Library             SeleniumLibrary
Resource           ../pages/login_pages.robot
Resource           ../fixtures/test_data.robot
Resource           ../support/validador.robot

*** Keywords ***
Inicio do Teste login
    Go To                          ${URL} 
    Set Selenium Speed             0.1
Fim do Teste login
    Capture Page Screenshot
Dado que o usuário está na página de login que contém o título "${TITULO}"
    Wait Until Page Contains       ${TITULO}
    Element Should Be Visible      ${TITULO_LOGIN}
Quando ele preenche suas credenciais corretamente e clica em "Login"
    [Arguments]                    ${username}           ${password}
    Input Text                     ${CAMPO_USERNAME}     ${username}
    Input Text                     ${CAMPO_PASSWORD}     ${password}
    Click Element                  ${BOTAO_LOGIN}
Então ele deve ser redirecionado para a página de produtos com sucesso
    [Arguments]                    ${logo}
    Wait Until Page Contains       ${logo}
    Element Should Be Visible      ${TITULO_PRODUCTS}
Quando ele preenche apenas o usuario e clica em "Login"
    [Arguments]                    ${username}
    Input Text                     ${CAMPO_USERNAME}     ${username}
    Click Element                  ${BOTAO_LOGIN}
Então ele deve ver uma mensagem de erro informando o requerimento do campo senha
    [Arguments]                    ${password}
    Verifica Mensagem de Erro      ${password}
  
Quando ele preenche apenas a senha e clica em "Login"
    [Arguments]                    ${password}
    Input Text                     ${CAMPO_PASSWORD}     ${password}
    Click Element                  ${BOTAO_LOGIN}
Então ele deve ver uma mensagem de erro informando o requerimento do campo usuario
    [Arguments]                    ${erro_message}  
    Verifica Mensagem de Erro      ${erro_message}
Quando ele preenche os campos de usuário e senha incorretos e clica em "Login"
    [Arguments]                    ${username}           ${password}
    Input Text                     ${CAMPO_USERNAME}     ${username}
    Input Text                     ${CAMPO_PASSWORD}     ${password}
    Click Element                  ${BOTAO_LOGIN}
Então ele deve ver uma mensagem de erro informando que as credenciais estão incorretas
    [Arguments]                    ${erro_message}  
    Verifica Mensagem de Erro      ${erro_message}
Dado que o usuário está logado na página de produtos
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}    ${logo}=${LOGO}
    Run Keyword    Quando ele preenche suas credenciais corretamente e clica em "Login"      ${username}    ${password}
    Run Keyword    Então ele deve ser redirecionado para a página de produtos com sucesso    ${logo}
Quando ele clica em "Logout"
    Click Button                   ${BOTAO_MENU}
    Element Should Be Visible      ${BOTAO_LOGOUT}
    Click Element                  ${BOTAO_LOGOUT}
Então ele deve ser redirecionado para a página de login com sucesso.
    Element Should Be Visible      ${TITULO_LOGIN}