*** Settings ***
Library           Browser
Resource          TopHeader.robot
Variables         ../Page_Elements/Payment.py
Variables         ../Page_Elements/TopHeader.py

*** Keywords ***
Fill Credit Card form
    [Arguments]    ${name}=autexercise    ${number}=4444333322221111    ${cvc}=555    ${month}=01    ${year}=2099
    Fill Text    ${CardName}    ${name}
    Fill Text    ${CardNumber}    ${number}
    Fill Text    ${CardCVC}    ${cvc}
    Fill Text    ${CardExpirationMonth}    ${month}
    Fill Text    ${CardExpirationYear}    ${year}

