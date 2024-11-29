*** Settings ***
Library           Browser
Variables         ../Page_Elements/Home.py
Variables         ../Page_Elements/TopHeader.py

*** Keywords ***
Launch Browser and Navigate to page
    [Arguments]    ${Page}=${HomePage}
    New Page    ${Page}
    Verify Consent and Accept

Verify Consent and Accept
    ${count}    Get Element Count    ${ConsentPopUp}
    Run Keyword If    ${count} > 0    Click    ${ConsentPopUpConfirmation}
