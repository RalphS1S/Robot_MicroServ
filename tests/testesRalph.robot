*** Settings ***
Library     SeleniumLibrary
Library     XML


*** Test Cases ***
Aprendendo Argumentos Name
    [Tags]    name
    My Keyword    John

Aprendendo Argumentos Name 2
    [Tags]    nome
    Minha palavrapasse    Ralph

Argumento Somatoria
    [Tags]    soma
    ${resultado}    Numeros somados    15    2
    Should Be Equal As Numbers    ${resultado}    17

Argumento localizar texto
    [Tags]    ftext
    Open Browser    http://localhost:3000/    Firefox
    Verificador de texto    //strong[contains(text(), 'Quero ser parceiro')]    Quero ser parceiro
    Close Browser

Login
    [Tags]    loginoff
    Open Browser    https://forumoff.com    Firefox
    Fazer Login    maradona    senhaqui
    Close Browser

Validar media
    [Tags]    media
    ${media}    Calcular media entre 3 numeros    9    2    19
    Log To Console    \nMédia é: ${media}
    Should Be Equal As Numbers    ${media}    10

Validar Palindromo
    [Tags]    palindromo
    Palindromo    radar
    Palindromo    robot

Navegar ForumOFF
    [Tags]    menuoff
    Open Browser    https://forumoff.com    Firefox
    Maximize Browser Window
    Fazer Login    login    senha
    Acessar menu    Meus Anexos
    Close Browser


*** Keywords ***
My Keyword
    [Arguments]    ${name}
    Log    Hello, ${name}!
    Log To Console    \nHello, ${name}!

Minha palavrapasse
    [Arguments]    ${nome}
    Log    Olá ${nome}, espero que esteja bem.
    Log To Console    Olá ${nome}, espero que esteja bem.

Numeros somados
    [Arguments]    ${num1}    ${num2}
    ${soma}    Evaluate    ${num1}+${num2}
    RETURN    ${soma}

Verificador de texto
    [Arguments]    ${locator}    ${texto_esperado}
    ${atual_texto}    Get Text    ${locator}
    Should Be Equal    ${atual_texto}    ${texto_esperado}

Fazer Login
    [Arguments]    ${nome}    ${senha}
    Input Text    id=auth    ${nome}
    Input Text    id=password    ${senha}
    Click Button    name=_processLogin

Calcular media entre 3 numeros
    [Arguments]    ${num1}    ${num2}    ${num3}
    ${media}    Evaluate    (${num1} + ${num2} + ${num3}) / 3
    RETURN    ${media}

Palindromo
    [Arguments]    ${texto}
    ${inverter_texto}    Evaluate    '${texto}'[::-1]
    IF    '${texto}' == '${inverter_texto}'
        Log To Console    \n${texto} é palindromo
    ELSE
        Log To Console    \n${texto} não é palindromo
    END

Acessar menu
    [Arguments]    ${nomeMenu}
    Wait Until Element Is Visible    //a[@id='elUserLink']    timeout=30
    Element Should Be Visible    //a[@id='elUserLink']
    Click Element    //a[@id='elUserLink']

    Wait Until Element Is Visible
    ...    //ul[@id='elUserLink_menu']//li/a[contains(text(), '? ${nomeMenu}')]    timeout=30
    Element Should Be Visible
    ...    //ul[@id='elUserLink_menu']//li/a[contains(text(), '? ${nomeMenu}')]

    Click Element    //ul[@id='elUserLink_menu']//li/a[contains(text(), '? ${nomeMenu}')]
