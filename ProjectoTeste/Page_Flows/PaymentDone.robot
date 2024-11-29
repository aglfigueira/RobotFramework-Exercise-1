*** Settings ***
Library           Browser
Resource          TopHeader.robot
Variables         ../Page_Elements/PaymentDone.py
Variables         ../Page_Elements/TopHeader.py

*** Keywords ***
Check Payment Done and Order Confirmed
    ${count}    Get Element Count    ${HeaderOrderPlaced}
    IF    ${count} == 0    Fail    No Logout Link - must not be logged on
    ${count}    Get Element Count    ${DownloadInvoiceButton}
    IF    ${count} == 0    Fail    No Logout Link - must not be logged on
