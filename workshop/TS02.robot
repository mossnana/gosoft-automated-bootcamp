*** Settings ***
Library     SeleniumLibrary
Library    XML
Force Tags          TS02
Suite Setup     Open Browser    ${URL}  ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${TIMEOUT}  10s
${URL}      https://allonline.7eleven.co.th
${BROWSER}  gc
${EMAIL}     samurai.hanso@gmail.com
${PASSWORD}     XXX
${PURCHASE_PRODUCT_NAME}    ไฮยีน เอ็กซ์เพิร์ทแคร์ น้ำยาปรับผ้านุ่ม ขาวมิลค์กี้ 1100 มล
${PURCHASE_PRODUCT_COUNT}   10
&{RECIPIENT_DETAIL}     ชื่อ=กิตติพงศ์  นามสกุล=วัฒนชัย     เบอร์มือถือ=0811034067
&{DELIVERY_ADDRESS}     บ้านเลขที่=89/12    หมู่=9  ตำบล=ลำลูกกา    อำเภอ=ลำลูกกา   จังหวัด=ปทุมธานี    รหัสไปรษณีย์=12150

*** Test Cases ***
Purchase ${PURCHASE_PRODUCT_NAME} ${PURCHASE_PRODUCT_COUNT} pcs. successed
    Maximize Browser Window
    Go to login page
    Login   ${EMAIL}    ${PASSWORD}
    Search product in search bar with keyword   ${PURCHASE_PRODUCT_NAME}
    See first product in product list
    Purchase product   ${PURCHASE_PRODUCT_COUNT}
    Inform recipient detail     ${RECIPIENT_DETAIL}
    Inform delivery address     ${DELIVERY_ADDRESS}
    Go to purchase detail    ${RECIPIENT_DETAIL}[เบอร์มือถือ]

*** Keywords ***
Go to login page
    Wait Until Element Is Visible    class=btn-allmember-login      timeout=${TIMEOUT}
    Click Element    class=btn-allmember-login
Login
    [Arguments]     ${email}     ${password}
    Wait Until Element Is Visible    name=email     timeout=${TIMEOUT}
    Input Text    name=email    ${email}
    Input Text    name=password    ${password}
    Click Element    xpath=//a[text()="เข้าสู่ระบบ"]
Search product in search bar with keyword
    [Arguments]     ${product_name}
    Wait Until Element Is Visible    name=q     timeout=${TIMEOUT}
    Input Text    name=q    ${product_name}
    Press Keys  None    RETURN
    Wait Until Element Is Visible    xpath=//div[contains(@class, "product_grid")]/div[1]
See first product in product list
    Click Element    xpath=//div[contains(@class, "product_grid")]/div[1]
Purchase product
    [Arguments]     ${amount}
    Wait Until Element Is Visible    id=title-product   timeout=${TIMEOUT}
    Input Text    name=order_count    ${amount}
    Click Element    xpath=//div[contains(@class, "btn-ads")][2]/button[1]
Inform recipient detail
    [Arguments]     ${detail}
    Wait Until Element Is Visible    class=tab-address  timeout=${TIMEOUT}
    Click Element    class=tab-address
    Wait Until Element Is Visible    class=new-address  timeout=${TIMEOUT}
    Click Element    class=new-address
    Wait Until Element Is Visible    id=new-address-name    timeout=${TIMEOUT}
    Input Text    id=new-address-name    ${detail}[ชื่อ]
    Input Text    id=new-address-lastname    ${detail}[นามสกุล]
    Input Text    id=new-address-mobile    ${detail}[เบอร์มือถือ]
Inform delivery address
    [Arguments]     ${address}
    Select From List By Value    id=new-address-province    ${address}[จังหวัด]
    Wait Until Element Is Visible    xpath=//select[@id="new-address-province"]/option[2]
    Select From List By Value    id=new-address-district    ${address}[อำเภอ]
    Wait Until Element Is Visible    xpath=//select[@id="new-address-province"]/option[2]
    Select From List By Value    id=new-address-sub-district    ${address}[ตำบล]
    Sleep    10
    Wait Until Element Is Visible    id=selected-location   timeout=${TIMEOUT}
    Click Element    id=selected-location
    Wait Until Element Is Visible    id=conf-dif-addr   timeout=${TIMEOUT}
    Click Element    id=conf-dif-addr
    Wait Until Element Is Visible    id=btn-accept-gdpr     timeout=${TIMEOUT}
    Click Element    id=btn-accept-gdpr
Go to purchase detail
    [Arguments]     ${truemoney_mobile}
    Wait Until Element Is Visible    id=continue-payment-btn    timeout=${TIMEOUT}
    Scroll Element Into View    id=continue-payment-btn
    Click Element    id=continue-payment-btn
    Wait Until Element Is Visible    xpath=//button[contains(@class, "COUNTERSERVICE_TMW-tab")]     timeout=${TIMEOUT}
    Click Element    xpath=//button[contains(@class, "COUNTERSERVICE_TMW-tab")]
    Input Text    id=checkoutData.paymentData.trueMoneyMobileNumber    ${truemoney_mobile}
    Click Element    xpath=//button[contains(@class, "continue-payment-btn")]
