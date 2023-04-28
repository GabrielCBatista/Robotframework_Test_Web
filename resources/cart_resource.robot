*** Settings ***
Library             SeleniumLibrary
Resource            ../fixtures/setup_teardown.robot
Resource            ../fixtures/test_data.robot
Resource            ../support/validador.robot
Resource            ../pages/cart_pages.robot
Resource            ../resources/produto_resource.robot
*** Keywords ***
Inicio do Teste cart
    Go To                          ${URL}
    Set Selenium Speed             0.1

Fim do Teste cart
    Capture Page Screenshot
Dado que estou na página do carrinho com "X" itens selecionados
    [Arguments]    ${valor1}    ${username}=${USERNAME}    ${password}=${PASSWORD}
    Run Keyword    Quando ele preenche suas credenciais corretamente e clica em "Login"      ${username}    ${password}
    Run Keyword And Continue On Failure    Quando adiciono "X" itens ao carrinho    ${valor1}
    Set Global Variable    ${GLOBAL_VALOR1}    ${valor1}
    Click Element                    ${CART}
    Element Should Be Visible        ${YCART}
Quando eu removo "X" produto do carrinho
    [Arguments]    ${valor2}
    Remover X      ${valor2}
    Set Global Variable            ${GLOBAL_RESULT}    ${valor2}
Então devo ter apenas a quantiade mantida no carrinho
    ${result}=    Evaluate    ${GLOBAL_VALOR1}-${GLOBAL_RESULT}
    Element Should Be Visible     //span[contains(.,'${result}')]
E estou na página de informações do comprador "Checkout: Your Information"
    Click Element    ${CHECKOUT}
Quando informo meu nome completo e endereço postal e clico em "CONTINUE"
    [Arguments]       ${name1}       ${name2}     ${cep}
    Input Text        ${FIRST}       ${name1}
    Input Text        ${LAST}        ${name2}
    Input Text        ${POSTAL}      ${cep}
    Click Element     ${CONTINUE}
Então devo ver a página de resumo do pedido "Checkout: Overview"
    Element Should Be Visible        ${OVERVIEW}
Quando não informo meu nome completo e clico em "CONTINUE"
    [Arguments]       ${name2}       ${cep}
    Input Text        ${LAST}        ${name2}
    Input Text        ${POSTAL}      ${cep}
    Click Element     ${CONTINUE}
Então devo ver a mensagem de erro "Error: First Name is required"
    [Arguments]                    ${erro_message}  
    Verifica Mensagem de Erro      ${erro_message}
Quando não informo meu sobrenome completo e clico em "CONTINUE"
    [Arguments]       ${name1}       ${cep}
    Input Text        ${FIRST}       ${name1}
    Input Text        ${POSTAL}      ${cep}
    Click Element     ${CONTINUE}
Então devo ver a mensagem de erro "Error: Last Name is required"
    [Arguments]                    ${erro_message}  
    Verifica Mensagem de Erro      ${erro_message}
Quando não informo meu cep completo e clico em "CONTINUE"
    [Arguments]       ${name1}       ${name2}
    Input Text        ${FIRST}       ${name1}
    Input Text        ${LAST}        ${name2}
    Click Element     ${CONTINUE}
Então devo ver a mensagem de erro "Error: Postal Code is required"
    [Arguments]                    ${erro_message}  
    Verifica Mensagem de Erro      ${erro_message}