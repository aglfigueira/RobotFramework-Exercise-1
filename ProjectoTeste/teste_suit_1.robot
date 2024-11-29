*** Settings ***
Library           Browser
Resource          Page_Flows/Cart.robot
Resource          Page_Flows/Checkout.robot
Resource          Page_Flows/Home.robot
Resource          Page_Flows/Login.robot
Resource          Page_Flows/Payment.robot
Resource          Page_Flows/PaymentDone.robot
Resource          Page_Flows/Products.robot
Resource          Page_Flows/TopHeader.robot
Variables         Page_Elements/Cart.py
Variables         Page_Elements/Checkout.py
Variables         Page_Elements/Home.py
Variables         Page_Elements/Login.py
Variables         Page_Elements/Payment.py
Variables         Page_Elements/PaymentDone.py
Variables         Page_Elements/Products.py
Variables         Page_Elements/TopHeader.py

*** Test Cases ***
Teste Exemplo
    New Page    https://playwright.dev/
    Get Text    h1    contains    Playwright
    ${/}

Teste Exercicio
    Launch Browser and Navigate to page
    Navigate to Products
    Search for    shirts
    Number of products greater than    2
    ${product1}    Add Product from the list and Continue    1
    ${product2}    Add Product from the list and Go to Cart    2
    Number of products in Cart greater than    2
    Verify Description of Product in Cart    ${product1}    1
    Verify Description of Product in Cart    ${product2}    2
    Click    ${Checkout}
    Click    ${CheckoutPopUpLogin}
    Login
    Navigate to Cart
    Click    ${Checkout}
    Number of products in Checkout greater than    2
    Verify Description of Product in Checkout    ${product1}    1
    Verify Description of Product in Checkout    ${product2}    2
    Click    ${PlaceOrder}
    Fill Credit Card form
    Click    ${ConfirmOrder}
    Check Payment Done and Order Confirmed
    [Teardown]    Close Browser
