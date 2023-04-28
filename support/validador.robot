*** Settings ***
Library            SeleniumLibrary
Library            Collections

Resource           ../fixtures/test_data.robot
Resource           ../fixtures/setup_teardown.robot

Resource           ../pages/cart_pages.robot
Resource           ../pages/check_pages.robot
Resource           ../pages/login_pages.robot
Resource           ../pages/produto_pages.robot

Resource           ../resources/cart_resource.robot
Resource           ../resources/check_resource.robot
Resource           ../resources/login_resource.robot
Resource           ../resources/produto_resource.robot


*** Keywords ***
Verifica Mensagem de Erro
    [Arguments]                         ${expected_message}
    Wait Until Page Contains Element    //h3[@data-test='error'][contains(.,'${expected_message}')]

Verificar se o elemento correto é exibido
    [Arguments]    ${argumento}
    ${element_text}    Get Text    (//div[contains(@class,'name')])[1]
    ${element_dols}    Get Text    (//div[contains(@class,'inventory_item_price')])[1]
    Run Keyword If    '${argumento}' == 'lohi'    Should Contain    ${element_dols}    $7.99
    Run Keyword If    '${argumento}' == 'hilo'    Should Contain    ${element_dols}    $49.99
    Run Keyword If    '${argumento}' == 'za'    Should Contain    ${element_text}    Test.allTheThings() T-Shirt (Red)
    Run Keyword If    '${argumento}' == 'az'    Should Contain    ${element_text}    Sauce Labs Backpack
Clicar em Produtos
    [Arguments]    ${quantidade}
    @{product_ids}    Create List    add-to-cart-sauce-labs-backpack    add-to-cart-sauce-labs-bike-light    add-to-cart-sauce-labs-bolt-t-shirt    add-to-cart-sauce-labs-fleece-jacket    add-to-cart-sauce-labs-onesie    add-to-cart-test.allthethings()-t-shirt-(red)
    ${count}=    Set Variable    0
    FOR    ${product}    IN    @{product_ids}
        ${button}=    Get WebElements    xpath=//button[contains(@data-test, '${product}')]
        FOR    ${elem}    IN    @{button}
            ${enabled}=    Call Method    ${elem}    is_enabled
            Run Keyword If    '${enabled}'=='True'    Click Element    ${elem}
        END
        ${count}=    Evaluate    ${count} + 1
        Exit For Loop If    ${count} == ${quantidade}
    END

Remover X
    [Arguments]    ${x}
    ${num_items}    Get Text    xpath=//span[@class='shopping_cart_badge']
    FOR    ${i}    IN RANGE    ${x}
        Click Button    xpath=(//button[contains(.,'Remove')])[1]
    END

Previa pedido
    [Arguments]    ${valor1}=3    ${username}=${USERNAME}    ${password}=${PASSWORD}    ${name1}=${NOME}    ${name2}=${SOBRENOME}     ${cep}=${CEP}
    Run Keyword    Quando ele preenche suas credenciais corretamente e clica em "Login"      ${username}    ${password}
    Run Keyword And Continue On Failure    Quando adiciono "X" itens ao carrinho    ${valor1}
    Set Global Variable    ${GLOBAL_VALOR1}    ${valor1}
    Click Element                    ${CART}
    Element Should Be Visible        ${YCART}
    Click Element     ${CHECKOUT}
    Input Text        ${FIRST}       ${name1}
    Input Text        ${LAST}        ${name2}
    Input Text        ${POSTAL}      ${cep}
    Click Element     continue

Verificar soma
    ${subtotal}=    Get Text    xpath=//div[@class='summary_subtotal_label']
    ${tax}=         Get Text    xpath=//div[@class='summary_tax_label']
    ${total}=       Get Text    xpath=//div[@class='summary_info_label summary_total_label']
    ${subtotal_float}=    Convert To Number    ${subtotal.split(': $')[1]}
    ${tax_float}=    Convert To Number    ${tax.split(': $')[1]}
    ${total_float}=    Convert To Number    ${total.split(': $')[1]}
    ${soma}=    Evaluate    ${subtotal_float} + ${tax_float}
    Should Be Equal As Numbers    ${soma}    ${total_float}    places=2
