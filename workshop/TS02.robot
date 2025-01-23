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
${RECIPIENT_FIRSTNAME}  กิตติพงศ์
${RECIPIENT_LASTNAME}   วัฒนชัย
${RECIPIENT_MOBILE}     0811034067
&{DELIVERY_ADDRESS}     บ้านเลขที่=89/12    หมู่=9  ตำบล=ลำลูกกา    อำเภอ=ลำลูกกา   จังหวัด=ปทุมธานี    รหัสไปรษณีย์=12150

*** Test Cases ***
Purchase Product
    Maximize Browser Window
    Wait Until Element Is Visible    class=btn-allmember-login      timeout=${TIMEOUT}
    Click Element    class=btn-allmember-login
    Wait Until Element Is Visible    name=email     timeout=${TIMEOUT}
    Input Text    name=email    ${EMAIL}
    Input Text    name=password    ${PASSWORD}
    Click Element    xpath=//a[text()="เข้าสู่ระบบ"]
    Wait Until Element Is Visible    name=q
    Input Text    name=q    ${PURCHASE_PRODUCT_NAME}
    Press Keys  None    RETURN
    Wait Until Element Is Visible    xpath=//div[contains(@class, "product_grid")]/div[1]
    Click Element    xpath=//div[contains(@class, "product_grid")]/div[1]
    Wait Until Element Is Visible    id=title-product
    Input Text    name=order_count    ${PURCHASE_PRODUCT_COUNT}
    Click Element    xpath=//div[contains(@class, "btn-ads")][2]/button[1]
    Wait Until Element Is Visible    class=tab-address
    Click Element    class=tab-address
    Wait Until Element Is Visible    class=new-address
    Click Element    class=new-address
    Wait Until Element Is Visible    id=new-address-name
    Input Text    id=new-address-name    ${RECIPIENT_FIRSTNAME}
    Input Text    id=new-address-lastname    ${RECIPIENT_LASTNAME}
    Input Text    id=new-address-mobile    ${RECIPIENT_MOBILE}
    Input Text    id=new-address-addrno    ${DELIVERY_ADDRESS}[บ้านเลขที่]
    Input Text    id=new-address-moo    ${DELIVERY_ADDRESS}[หมู่]
    Select From List By Value    id=new-address-province    ${DELIVERY_ADDRESS}[จังหวัด]
    Wait Until Element Is Visible    xpath=//select[@id="new-address-province"]/option[2]
    Select From List By Value    id=new-address-district    ${DELIVERY_ADDRESS}[อำเภอ]
    Wait Until Element Is Visible    xpath=//select[@id="new-address-province"]/option[2]
    Select From List By Value    id=new-address-sub-district    ${DELIVERY_ADDRESS}[ตำบล]
    Sleep    10
    Wait Until Element Is Visible    id=selected-location   timeout=${TIMEOUT}
    Click Element    id=selected-location
    Wait Until Element Is Visible    id=conf-dif-addr   timeout=${TIMEOUT}
    Click Element    id=conf-dif-addr
    Wait Until Element Is Visible    id=btn-accept-gdpr     timeout=${TIMEOUT}
    Click Element    id=btn-accept-gdpr
    Wait Until Element Is Visible    id=continue-payment-btn    timeout=${TIMEOUT}
    Scroll Element Into View    id=continue-payment-btn
    Click Element    id=continue-payment-btn
    Wait Until Element Is Visible    xpath=//button[contains(@class, "COUNTERSERVICE_TMW-tab")]
    Click Element    xpath=//button[contains(@class, "COUNTERSERVICE_TMW-tab")]
    Input Text    id=checkoutData.paymentData.trueMoneyMobileNumber    ${RECIPIENT_MOBILE}
    Click Element    xpath=//button[contains(@class, "continue-payment-btn")]

*** Keywords ***

