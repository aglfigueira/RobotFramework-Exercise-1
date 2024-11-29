*** Settings ***
Library           Browser
Variables         ../Page_Elements/TopHeader.py

*** Keywords ***
Navigate to Products
    Click    ${ProductsLink}

Navigate to Cart
    Click    ${CartLink}