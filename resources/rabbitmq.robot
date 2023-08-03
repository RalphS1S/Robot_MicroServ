*** Settings ***
Documentation       RabbitMQ Helpers api

Library             RequestsLibrary


*** Variables ***
${RABBIT_URL}           https://shark.rmq.cloudamqp.com/api/queues/qxqfqtki/email
&{RABBIT_HEADERS}
...                     Content-Type=pplication/json
...                     Authorization=Basic cXhxZnF0a2k6WDRDMndiMTZPV0hGbXhybkpiMGFUWXVrT3J6eGc5Q3E=


*** Keywords ***
Purge Messages
    ${payload}    Create Dictionary
    ...    vhost=qxqfqtki
    ...    name=email
    ...    mode=purge

    ${response}    DELETE    ${RABBIT_URL}/contents    json=${payload}    headers=${RABBIT_HEADERS}

Get Message
    ${payload}    Create Dictionary
    ...    vhost=qxqfqtki
    ...    name=email
    ...    truncate=50000
    ...    ackmode=ack_requeue_true
    ...    encoding=auto
    ...    count=1

    ${response}    POST    ${RABBIT_URL}/get    json=${payload}    headers=${RABBIT_HEADERS}
    RETURN    ${response.json()}[0]

