*** Settings ***
Documentation       Put /partners

Resource            ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should be enable a partner
    ${partner}    Factory Enable Partner

    ${partner_id}    Create a new partner    ${partner}

    ${response}    Enable Partner    ${partner_id}
    Status Should Be    200

Should be desable a partner
    ${partner}    Factory Desable Partner

    ${partner_id}    Create a new partner    ${partner}
    Enable Partner    ${partner_id}

    ${response}    Enable Partner    ${partner_id}
    Status Should Be    200

Should return 404 on enable a partner
    ${partner}    Factory 404 Partner

    ${partner_id}    Create a new partner    ${partner}

    Remove Partner By Name    ${partner}[name]

    ${response}    Enable Partner    ${partner_id}
    Status Should Be    404

Should return 404 on desable a partner
    ${partner}    Factory 404 Partner

    ${partner_id}    Create a new partner    ${partner}

    Remove Partner By Name    ${partner}[name]

    ${response}    Disable Partner    ${partner_id}
    Status Should Be    404
