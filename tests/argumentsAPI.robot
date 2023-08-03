*** Settings ***
Documentation       Criando exercícios para fixar métodos e argumentos

Library             RequestsLibrary


*** Variables ***
${BASE_URL}     https://reqres.in
${END_P}        /api/users?page=2
${END_P1}       /api/users


*** Test Cases ***
Enviar requisicao GET e Verificar Status
    [Tags]    get
    Verificando status code GET    ${BASE_URL}${END_P}    200

Enviar requisicao POST e verificar POST
    [Tags]    post
    ${body}    Create Dictionary    name=Ralph    job=TechLead
    Verificando status code POST    ${BASE_URL}${END_P1}    ${body}


*** Keywords ***
Verificando status code GET
    [Arguments]    ${url}    ${status_esperado}
    ${response}    GET    ${url}
    Status Should Be    ${status_esperado}

Verificando status code POST
    [Arguments]    ${url}    ${payload}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST    ${url}    json=${payload}    headers=${headers}
    Status Should Be    201
