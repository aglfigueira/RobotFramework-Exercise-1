*** Settings ***
Library           Browser
Variables         ../Page_Elements/Checkout.py

*** Keywords ***
Number of products in Checkout greater than
    [Arguments]    ${NumberProducts}
    [Documentation]    If number of products in the Checkout list is greater or equal than the argument returns true
    ${count}    Get Element Count    ${CheckoutProducts}
    IF    ${count} >= ${NumberProducts}    RETURN    ${True}
    Fail    No sufficient number of products
    RETURN    ${False}

Verify Description of Product in Checkout
    [Arguments]    ${Description}    ${NumberInCheckout}
    ${text}    Get Text    (${CheckoutProductDetail})[${NumberInCheckout}]
    IF    '${text}'=='${Description}'    RETURN    ${True}
    Fail    Description does not match
