*** Settings ***
Resource        ../resource/QaPbResource.robot
Suite Setup      Open Navigator
Suite Teardown   Close Navigator


*** Variables ***

${EXECUTIONS}       10
${CONTADOR}         ${EXECUTIONS}

*** Test Case ***
TC01 - Click Buttons
    Go To Home Page
    Click Buttons

TC02 - Click Edit And Delete
    Repeat Keyword  ${EXECUTIONS}   Click Edit and Delete Buttons

*** Keywords ***