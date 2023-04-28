*** Settings ***
Resource           ../fixtures/setup_teardown.robot
Resource           ../fixtures/test_data.robot
Resource           ../resources/produto_resource.robot
Resource           ../pages/produto_pages.robot

Suite Setup        Run Keywords    Inicio
Suite Teardown     Run Keywords    fim
Test Setup         Inicio do Teste produto
Test Teardown      Fim do Teste produto

*** Test Cases ***
Ordenação de Produtos - Z-A
    [Documentation]     Verificar se a ordenação dos produtos está funcionando corretamente (Z-A)
    [Tags]              Z-A_Order
    Dado que estou na página de produtos
    E o título da página é "Products"
    Quando seleciono a opção de ordenação Z-A           ${LIST_ORDEN}[2]
    Então os produtos devem estar ordenados de Z-A      ${LIST_ORDEN}[2]

Ordenação de Produtos - Preço Baixo-Alto
    [Documentation]     Verificar se a ordenação dos produtos está funcionando corretamente (Preço Baixo-Alto)
    [Tags]              Preco_Baixo_Alto_Order
    Dado que estou na página de produtos
    E o título da página é "Products"
    Quando seleciono a opção de ordenação Preço Baixo-Alto         ${LIST_ORDEN}[3]
    Então os produtos devem estar ordenados de Preço Baixo-Alto    ${LIST_ORDEN}[3]

Ordenação de Produtos - Preço Alto-Baixo
    [Documentation]     Verificar se a ordenação dos produtos está funcionando corretamente (Preço Alto-Baixo)
    [Tags]              Preco_Alto_Baixo_Order
    Dado que estou na página de produtos
    E o título da página é "Products"
    Quando seleciono a opção de ordenação Preço Alto-Baixo        ${LIST_ORDEN}[4]
    Então os produtos devem estar ordenados de Preço Alto-Baixo   ${LIST_ORDEN}[4]

Ordenação de Produtos - A-Z
    [Documentation]     Verificar se a ordenação dos produtos está funcionando corretamente (A-Z)
    [Tags]              A-Z_Order
    Dado que estou na página de produtos
    E o título da página é "Products"
    Quando seleciono a opção de ordenação A-Z                    ${LIST_ORDEN}[1]
    Então os produtos devem estar ordenados de A-Z               ${LIST_ORDEN}[1]

Adicionar ao Carrinho - Múltiplos Itens
    [Documentation]     Verificar se é possível adicionar múltiplos itens ao carrinho
    [Tags]              Add_to_Cart
    Dado que estou na página de produtos
    E o título da página é "Products"
    Quando adiciono "X" itens ao carrinho                       3
    Então a imagem do carrinho deve exibir o número "X"         3

Remover do Carrinho - Múltiplos Itens
    [Documentation]     Verificar se é possível remover múltiplos itens do carrinho
    [Tags]              Remove_from_Cart
    Dado que estou na página de produtos
    E o título da página é "Products"
    E removo os todos itens do carrinho
    Então a imagem do carrinho deve estar vazia