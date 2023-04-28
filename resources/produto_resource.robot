*** Settings ***
Library             SeleniumLibrary
Resource            ../fixtures/setup_teardown.robot
Resource            ../fixtures/test_data.robot
Resource            ../support/validador.robot
Resource            ../pages/produto_pages.robot

*** Keywords ***
Inicio do Teste produto
    Go To                          ${URL}
    Set Selenium Speed             0.1

Fim do Teste produto
    Capture Page Screenshot
Dado que estou na página de produtos
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}
    Run Keyword    Quando ele preenche suas credenciais corretamente e clica em "Login"      ${username}    ${password}

E o título da página é "Products"
    [Arguments]        ${logo}=${LOGO}
    Run Keyword    Então ele deve ser redirecionado para a página de produtos com sucesso    ${logo}

Quando seleciono a opção de ordenação Z-A
    [Arguments]       ${orden}
    Click Element     ${CONTAINER}
    Select From List By Value    ${CONTAINER}    ${orden}
Então os produtos devem estar ordenados de Z-A
    [Arguments]       ${orden}
    Run Keyword       Verificar se o elemento correto é exibido    ${orden}

Quando seleciono a opção de ordenação Preço Baixo-Alto
    [Arguments]       ${orden}
    Click Element     ${CONTAINER}
    Select From List By Value    ${CONTAINER}    ${orden}
Então os produtos devem estar ordenados de Preço Baixo-Alto
    [Arguments]       ${orden}
    Run Keyword       Verificar se o elemento correto é exibido    ${orden}
Quando seleciono a opção de ordenação Preço Alto-Baixo
    [Arguments]       ${orden}
    Click Element     ${CONTAINER}
    Select From List By Value    ${CONTAINER}    ${orden}
Então os produtos devem estar ordenados de Preço Alto-Baixo
    [Arguments]       ${orden}
    Run Keyword       Verificar se o elemento correto é exibido    ${orden}
Quando seleciono a opção de ordenação A-Z
    [Arguments]       ${orden}
    Click Element     ${CONTAINER}
    Select From List By Value    ${CONTAINER}    ${orden}
Então os produtos devem estar ordenados de A-Z
    [Arguments]       ${orden}
    Run Keyword       Verificar se o elemento correto é exibido    ${orden}

Quando adiciono "X" itens ao carrinho
    [Arguments]    ${index}
    Run Keyword    Clicar em Produtos    ${index}
Então a imagem do carrinho deve exibir o número "X"
    [Arguments]    ${argumento}
    Set Global Variable    ${CARRINHO}    //span[contains(.,'${argumento}')]
    Element Should Be Visible    ${CARRINHO}
E removo os todos itens do carrinho
    @{botoes_remover}=    Get WebElements    ${BOTAO_REMOVER}
    FOR    ${botao}    IN    @{botoes_remover}
    Click Element    ${botao}
    END
Então a imagem do carrinho deve estar vazia
    Element Should Be Visible                 ${CARRINHO_0}