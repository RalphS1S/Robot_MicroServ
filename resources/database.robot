*** Settings ***
Documentation       Databse helpers connection

Library             RobotMongoDBLibrary.Delete
Library             RobotMongoDBLibrary.Find


*** Variables ***
&{MONGO_URI}
...             connection=mongodb+srv://burgereats:aiNFFQ64kEMFRCRo@ralphmicros.b9sq13f.mongodb.net/PartnerDB?retryWrites=true&w=majority
...             database=PartnerDB
...             collection=partner


*** Keywords ***
Remove Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    name=${partner_name}

    Delete One    ${MONGO_URI}    ${filter}

Find Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    name=${partner_name}

    ${results}    Find    ${MONGO_URI}    ${filter}

    [return]    ${results}[0]
