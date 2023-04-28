*** Settings ***
Resource           ../fixtures/setup_teardown.robot
Resource           ../fixtures/test_data.robot
Resource           ../resources/check_resource.robot

Suite Setup        Run Keywords    Inicio
Suite Teardown     Run Keywords    fim
Test Setup         Inicio do Teste check
Test Teardown      Fim do Teste check

*** Test Cases ***
Cenário 1: Validar preços dos produtos
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra.
    [Tags]              ValidarPrecos
    Dado que eu estou na tela de checkout com "X" itens selecionados
    Então devo ver o nome e o preço de cada produto no resumo do pedido, e também o subtotal, imposto e total.

Cenário 2: Confirmar pedido
    [Documentation]     Como usuário, quero confirmar meu pedido de compra.
    [Tags]              ConfirmarPedido
    Dado que eu estou na tela de checkout com "X" itens selecionados
    Quando eu confirmo o pedido de compra
    Então devo ver a mensagem "Thank you for your order!" na tela    ${FIM DO PEDIDO}