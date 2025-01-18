*** Settings ***
Force Tags          Credit Card
Library    SeleniumLibrary
Library    XML
Library    Process
Suite Setup     Open Browser    url=${SHOP_WEBSITE_DEV}     browser=gc
Suite Teardown  Close All Browsers

*** Variables ***
${SEARCH_KEYWORD} =     bicy
${PRODUCT_NAME} =   Balance Training Bicycle
${SHOP_WEBSITE_DEV} =   http://159.223.71.75/product/list
${SHOP_WEBSITE_SIT} =   http://165.22.255.65/product/list
${SHOP_WEBSITE_UAT} =   http://159.223.89.151/product/list


*** Test Cases ***
Purchase Product by Visa Credit Card Success
    Maximize Browser Window
    Search Product
    Find Product Balance Training Bicycle
    Choose Product
    Check Product Detail
    Add Product Amount
    Add Product in Shopping Cart
    Check Shopping Cart
    Checkout Shopping Cart
    Inform Shopping Information
    Click Pay Now
    Validate OTP
    Inform Notifications Information

*** Keywords ***
Search Product
    Input Text    id=search-product-input    ${SEARCH_KEYWORD}
    Click Element   id=search-product-btn
Find Product Balance Training Bicycle
    Wait Until Element Is Visible    id=product-card-1
    Element Should Contain    id=product-card-1    Balance Training Bicycle
    Element Should Contain    id=product-card-price-1    ฿4,314.60
Choose Product
    Click Element    id=product-card-1
Check Product Detail
    Wait Until Element Is Visible    id=product-detail-product-name
    Element Should Contain    id=product-detail-product-name    ${PRODUCT_NAME}
    Element Should Contain    id=product-detail-brand    SportsFun
    Element Should Contain    id=product-detail-price-thb    ฿4,314.60
    Element Should Contain    id=product-detail-point    43 Points
    Element Should Contain    id=product-detail-stock    items
Add Product in Shopping Cart
    Click Element    id=product-detail-add-to-cart-btn
Add Product Amount
    Click Element    id=product-detail-quantity-increment-btn
    Element Attribute Value Should Be    id=product-detail-quantity-input    attribute=value    expected=2
    Click Element    id=product-detail-quantity-decrement-btn
    Element Attribute Value Should Be    id=product-detail-quantity-input    attribute=value    expected=1
Check Shopping Cart
    Element Should Not Contain    id=header-menu-cart-badge    0
    Click Element    id=header-menu-cart-badge
    Wait Until Element Is Visible    id=product-1-name
    Element Should Contain    id=product-1-name    ${PRODUCT_NAME}
    Wait Until Element Is Visible    id=product-1-point
    Element Should Contain    id=product-1-point    Points
Checkout Shopping Cart
    Click Element    id=shopping-cart-checkout-btn
Inform Shopping Information
    Input Text    id=shipping-form-first-name-input    หีบ
    Input Text    id=shipping-form-last-name-input    เหินหาว
    Input Text    id=shipping-form-address-input    หิ้วหวีไป หิ้วหวีมา รถเลี้ยวซ้าย รถเลี้ยวขวา ชักกระตุกๆๆๆๆ
    Select From List By Value    id=shipping-form-province-select    1
    Select From List By Value    id=shipping-form-district-select    1001
    Select From List By Value    id=shipping-form-sub-district-select    100101
    Input Text    id=shipping-form-mobile-input     0800000000
    Click Element    id=shipping-method-2-time
    Input Text    id=payment-credit-form-fullname-input    หีบ เหินหาว
    Input Text    id=payment-credit-form-card-number-input    4111111111111111
    Input Text    id=payment-credit-form-expiry-input    03/12
    Input Text    id=payment-credit-form-cvv-input    000
Click Pay Now
    Click Element    id=payment-now-btn
Request OTP
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[3]/div[2]/button
    Click Element    xpath=/html/body/div/div/div[3]/div[2]/button
Validate OTP
    Wait Until Element Is Visible    id=otp-input
    Input Text    id=otp-input    111111
    Click Element    xpath=/html/body/div/div/div[4]/button[1]
Inform Notifications Information
    Wait Until Element Is Visible    id=notification-form-email-input
    Input Text    id=notification-form-email-input    hh@hh.com
    Input Text    id=notification-form-mobile-input    080000000
    Click Element    id=send-notification-btn
    Press Keys  None    RETURN