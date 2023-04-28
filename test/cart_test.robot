*** Settings ***
Resource           ../fixtures/setup_teardown.robot
Resource           ../fixtures/test_data.robot
Resource           ../resources/cart_resource.robot
Resource           ../pages/cart_pages.robot

Suite Setup        Run Keywords    Inicio
Suite Teardown     Run Keywords    fim
Test Setup         Inicio do Teste cart
Test Teardown      Fim do Teste cart

*** Test Cases ***
Cenário 1: Informações de envio do pedido
    [Documentation]     Como usuário, quero informar meu nome completo e endereço postal para envio do pedido
    [Tags]              address-info
    Dado que estou na página do carrinho com "X" itens selecionados    3
    E estou na página de informações do comprador "Checkout: Your Information"
    Quando informo meu nome completo e endereço postal e clico em "CONTINUE"    ${NOME}      ${SOBRENOME}    ${CEP} 
    Então devo ver a página de resumo do pedido "Checkout: Overview"

Cenário 2: Validação do campo de nome
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra
    [Tags]              name-validation
    Dado que estou na página do carrinho com "X" itens selecionados    3
    E estou na página de informações do comprador "Checkout: Your Information"
    Quando não informo meu nome completo e clico em "CONTINUE"                ${SOBRENOME}    ${CEP} 
    Então devo ver a mensagem de erro "Error: First Name is required"         ${ERRO_FIRST}

Cenário 3: Validação do campo de sobrenome
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra
    [Tags]              name-validation
    Dado que estou na página do carrinho com "X" itens selecionados    3
    E estou na página de informações do comprador "Checkout: Your Information"
    Quando não informo meu sobrenome completo e clico em "CONTINUE"            ${NOME}       ${CEP} 
    Então devo ver a mensagem de erro "Error: Last Name is required"           ${ERRO_LEST}

Cenário 4: Validação do campo de cep
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra
    [Tags]              name-validation
    Dado que estou na página do carrinho com "X" itens selecionados    3
    E estou na página de informações do comprador "Checkout: Your Information"
    Quando não informo meu cep completo e clico em "CONTINUE"                 ${NOME}       ${SOBRENOME} 
    Então devo ver a mensagem de erro "Error: Postal Code is required"        ${ERRO_POSTAL}
Cenário 5: Remoção de produtos do carrinho
    [Documentation]     Como usuário, quero remover um produto do carrinho
    [Tags]              remove-product
    Dado que estou na página do carrinho com "X" itens selecionados    3
    Quando eu removo "X" produto do carrinho                           1
    Então devo ter apenas a quantiade mantida no carrinho
