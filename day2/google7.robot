*** Settings ***
Library  SeleniumLibrary
Suite Setup  เปิดเว็บเบราว์เซอร์
Suite Teardown   ปิดเว็บเบราว์เซอร์
Test Setup  เข้า Google
Test Template   ค้นหาและตรวจสอบคำว่า

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc

*** Test Cases ***
ทดสอบใส่คำว่า PIM ควรเจอคำว่า สถาบันการจัดการปัญญาภิวัฒน์   PIM     สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำว่า CP ควรเจอคำว่า พันล้าน    CP      พันล้าน
ทดสอบใส่คำว่า อาจารย์แดง ควรเจอคำว่า กระตุกจิต กระชากใจ   อาจารย์แดง      กระตุกจิต กระชากใจ


*** Keywords ***
ค้นหาและตรวจสอบคำว่า
    [Arguments]     ${KEYWORD}      ${EXPECT}
    ใส่คำค้นหา      ${KEYWORD}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา       ${EXPECT}
เปิดเว็บเบราว์เซอร์
    Open Browser    browser=${BROWSER}
เข้า Google
    Go To    url=https://google.com
ใส่คำค้นหา
    [Arguments]     ${KEYWORD}
    Input Text    name=q   text=${KEYWORD}
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    [Arguments]     ${EXPECT}
    Wait Until Page Contains    text=${EXPECT}
ปิดเว็บเบราว์เซอร์
    Close All Browsers