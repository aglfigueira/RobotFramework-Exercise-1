*** Settings ***
Library           Browser
Variables         ../Page_Elements/Cart.py

*** Keywords ***
Number of products in Cart greater than
    [Arguments]    ${NumberProducts}
    [Documentation]    If number of products in the cart list is greater or equal than the argument returns true
    ${count}    Get Element Count    ${CartProducts}
    IF    ${count} >= ${NumberProducts}    RETURN    ${True}
    Fail    No sufficient number of products
    RETURN    ${False}

Verify Description of Product in Cart
    [Arguments]    ${Description}    ${NumberInCart}
    ${text}    Get Text    (${CartProductDetail})[${NumberInCart}]
    IF    '${text}'=='${Description}'    RETURN    ${True}
    Fail    Description does not match
