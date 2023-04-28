*** Settings ***
Resource           ../fixtures/setup_teardown.robot
Resource           ../fixtures/test_data.robot
Resource           ../resources/login_resource.robot

Suite Setup        Run Keywords    Inicio
Suite Teardown     Run Keywords    fim
Test Setup         Inicio do Teste login
Test Teardown      Fim do Teste login

*** Test Cases ***
Cenário 1: Login bem-sucedido
    [Documentation]     Verificar se o usuário é capaz de fazer login com sucesso na página de login
    [Tags]              @login
    Dado que o usuário está na página de login que contém o título "Swag Labs"    
    Quando ele preenche suas credenciais corretamente e clica em "Login"                         ${USERNAME}     ${PASSWORD}
    Então ele deve ser redirecionado para a página de produtos com sucesso                       ${LOGO}

Cenário 2: Login sem senha
    [Documentation]     Verificar se o usuário é notificado corretamente sobre o erro de login quando preenche um usuário inválido
    [Tags]              @login
    Dado que o usuário está na página de login que contém o título "Swag Labs"
    Quando ele preenche apenas o usuario e clica em "Login"                                      ${USERNAME}
    Então ele deve ver uma mensagem de erro informando o requerimento do campo senha             ${PASSWORD_REQUIRED}

Cenário 3: Login sem usuario
    [Documentation]     Verificar se o usuário é notificado corretamente sobre o erro de login quando preenche uma senha inválida
    [Tags]              @login
    Dado que o usuário está na página de login que contém o título "Swag Labs"
    Quando ele preenche apenas a senha e clica em "Login"                                         ${PASSWORD}
    Então ele deve ver uma mensagem de erro informando o requerimento do campo usuario            ${USERNAME_REQUIRED}

Cenário 4: Login com campos vazios
    [Documentation]     Verificar se o usuário é notificado corretamente sobre o erro de login quando deixa os campos de usuário e senha em branco
    [Tags]              @login
    Dado que o usuário está na página de login que contém o título "Swag Labs"
    Quando ele preenche os campos de usuário e senha incorretos e clica em "Login"                ${NOME}        ${SENHA}
    Então ele deve ver uma mensagem de erro informando que as credenciais estão incorretas        ${INVALID_CREDENTIALS}

Cenário 5: Redirecionamento para a página de login após fazer logout
    [Documentation]     Verificar se o usuário é redirecionado para a página de login após fazer logout com sucesso na página de produtos
    [Tags]              @login
    Dado que o usuário está logado na página de produtos
    Quando ele clica em "Logout"
    Então ele deve ser redirecionado para a página de login com sucesso.