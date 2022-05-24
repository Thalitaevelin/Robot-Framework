*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             BuiltIn

*** Variables ***
${BROWSER}                 chrome
${URL}                     https://the-internet.herokuapp.com/challenging_dom
${HOMEPAGETITLE}           The Internet
${DEFAULTCONTENT}          //*[@id="content"]

#BOTOES
${BTN01}    //html/body/div[2]/div/div/div/div/div[1]/a[1]
${BTN02}    //html/body/div[2]/div/div/div/div/div[1]/a[2]
${BTN03}    //html/body/div[2]/div/div/div/div/div[1]/a[3]

${COUNT}     1

${URLEDIT}      https://the-internet.herokuapp.com/challenging_dom#edit
${URLDELETE}    https://the-internet.herokuapp.com/challenging_dom#delete

*** Keywords ***
Open Navigator
    Open BROWSER  about:blank  ${BROWSER}
    Maximize Browser Window

Go To Home Page
    Go To   ${URL}
    Wait Until Element Is Visible  ${DEFAULTCONTENT}
    Title Should Be  ${HOMEPAGETITLE}

Close Navigator
    Close BROWSER

Click Buttons
#CLIQUE DO PRIMEIRO BOTÃO
    ${STRBTN}=   Get Element Attribute   ${BTN01}    id
    #PARA VER O ID DO BOTÃO NO PRIMEIRO MOMENTO - ANTES DO CLIQUE
    Log to Console  ${STRBTN}
    Set Test Variable   ${STRBTN}
    Click Element    ${BTN01}
    ${STRBTNNEW}=   Get Element Attribute   ${BTN01}    id
    #PARA VER O ID DO BOTÃO APÓS O CLIQUE
    Log to Console  ${STRBTNNEW}
    Set Test Variable   ${STRBTNNEW}
    Should Not Be Equal     ${STRBTN}   ${STRBTNNEW}
    Log to Console  Botão 1 - OK!

#CLIQUE DO SEGUNDO BOTÃO
    ${STRBTN}=   Get Element Attribute   ${BTN02}    id
    #Log to Console  ${STRBTN}
    Set Test Variable   ${STRBTN}
    Click Element    ${BTN02}
    ${STRBTNNEW}=   Get Element Attribute   ${BTN02}    id
    #Log to Console  ${STRBTNNEW}
    Set Test Variable   ${STRBTNNEW}
    Should Not Be Equal     ${STRBTN}   ${STRBTNNEW}
    Log to Console  Botão 2 - OK!

#CLIQUE DO TECEIRO BOTÃO
    ${STRBTN}=   Get Element Attribute   ${BTN03}    id
    #Log to Console  ${STRBTN}
    Set Test Variable   ${STRBTN}
    Click Element    ${BTN03}
    ${STRBTNNEW}=   Get Element Attribute   ${BTN03}    id
    #Log to Console  ${STRBTNNEW}
    Set Test Variable   ${STRBTNNEW}
    Should Not Be Equal     ${STRBTN}   ${STRBTNNEW}
    Log to Console  Botão 3 - OK!


Click Edit Button
    Click Element   //*[@id="content"]/div/div/div/div[2]/table/tbody/tr[${COUNT}]/td[7]/a[1]
    #PARA VER AS POSIÇÕES QUE ELE ACESSOU NO CLICK
    #Log to Console  //*[@id="content"]/div/div/div/div[2]/table/tbody/tr[${COUNT}]/td[7]/a[1]
    Log to Console  Botão Edit - Posição ${COUNT} OK!
    ${URL}=   Get Location
    Should be Equal     ${URL}  ${URLEDIT}
    Log to Console  URL ACESSADA NO CLIQUE: ${URL}


Click Delete Button
    Click Element   //*[@id="content"]/div/div/div/div[2]/table/tbody/tr[${COUNT}]/td[7]/a[2]
    #PARA VER AS POSIÇÕES QUE ELE ACESSOU NO CLICK
    #Log to Console  //*[@id="content"]/div/div/div/div[2]/table/tbody/tr[${COUNT}]/td[7]/a[2]
    Log to Console  Botão Delete - Posição ${COUNT} OK!
    ${URL}=   Get Location
    Should be Equal     ${URL}  ${URLDELETE}
    Log to Console  URL ACESSADA NO CLIQUE: ${URL}


Click Edit and Delete Buttons
    Click Edit Button
    Click Delete Button
    ${COUNT}=    Evaluate    ${COUNT} + ${1}
    Set Global Variable     ${COUNT}