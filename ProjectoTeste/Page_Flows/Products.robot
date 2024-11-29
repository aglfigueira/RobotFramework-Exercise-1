*** Settings ***
Library           Browser
Variables         ../Page_Elements/Products.py

*** Keywords ***
Search for
    [Arguments]    ${SearchTerm}
    [Documentation]    Searches for an element and returns the number of elements in the product list.
    Fill Text    ${SearchInput}    ${SearchTerm}
    Click    ${SearchSubmit}
    ${count}    Get Element Count    ${SearchResultProducts}
    IF    ${count} > 0    RETURN    ${count}
    RETURN    0

Number of products greater than
    [Arguments]    ${NumberProducts}
    [Documentation]    If number of products is greater or equal than the argument returns true
    ${count}    Get Element Count    ${SearchResultProducts}
    IF    ${count} >= ${NumberProducts}    RETURN    ${True}
    Fail    No sufficient number of products
    RETURN    ${False}

Add Product from the list and Continue
    [Arguments]    ${Number}
    [Documentation]    Returns the description of the product
    ${productText}    Get Text    (${ProductsGetText})[${Number}]
    Click    (${ProductsAddToCart})[${Number}]
    Click    ${PopUpContinueShopping}
    RETURN    ${productText}

Add Product from the list and Go to Cart
    [Arguments]    ${Number}
    [Documentation]    Returns the description of the product
    ${productText}    Get Text    (${ProductsGetText})[${Number}]
    Click    (${ProductsAddToCart})[${Number}]
    Click    ${PopUpViewCart}
    RETURN    ${productText}
