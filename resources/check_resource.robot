*** Settings ***
Library             SeleniumLibrary
Resource           ../fixtures/test_data.robot
Resource           ../fixtures/setup_teardown.robot
Resource           ../support/validador.robot

Resource           ../pages/check_pages.robot
Resource           ../resources/check_resource.robot



*** Keywords ***
Inicio do Teste check
    Go To                          ${URL}
    Set Selenium Speed             0.1
Fim do Teste check
    Capture Page Screenshot
Dado que eu estou na tela de checkout com "X" itens selecionados
    Run Keyword    Previa pedido
    Verificar soma
Então devo ver o nome e o preço de cada produto no resumo do pedido, e também o subtotal, imposto e total.
    Element Should Be Visible    ${PEDIDO} 
    Element Should Be Visible    ${SUBTOTAL}
    Element Should Be Visible    ${IMPOSTO}
    Element Should Be Visible    ${TOTAL}
Quando eu confirmo o pedido de compra
    Click Element                ${FINISH}
Então devo ver a mensagem "Thank you for your order!" na tela
    [Arguments]                    ${erro_message}  
    Element Should Be Visible      ${erro_message}