*** Settings ***
Library           Browser
Resource          TopHeader.robot
Variables         ../Page_Elements/Login.py
Variables         ../Page_Elements/TopHeader.py

*** Keywords ***
Login
    [Arguments]    ${email}=${TestEmail}    ${pass}=${TestPass}
    Fill Text    ${LoginEmail}    ${email}
    Fill Text    ${LoginPassword}    ${pass}
    Click    ${LoginButton}
    ${count}    Get Element Count    ${LogoutLink}
    IF    ${count} == 0    Fail    No Logout Link - must not be logged on
    ${count}    Get Element Count    ${UserLogged}
    IF    ${count} == 0    Fail    No Logout Link - must not be logged on
