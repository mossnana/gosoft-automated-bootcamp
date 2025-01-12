*** Settings ***
Library  SeleniumLibrary
Test Setup  เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown   ปิดเว็บเบราว์เซอร์

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc

*** Test Cases ***
ทดสอบใส่คำว่า PIM ควรเจอคำว่า สถาบันการจัดการปัญญาภิวัฒน์
    ค้นหาและตรวจสอบคำว่า    PIM     สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำว่า CP ควรเจอคำว่า พันล้าน
    ค้นหาและตรวจสอบคำว่า    CP      พันล้าน

ทดสอบใส่คำว่า อาจารย์แดง ควรเจอคำว่า กระตุกจิต กระชากใจ
    ค้นหาและตรวจสอบคำว่า    อาจารย์แดง      กระตุกจิต กระชากใจ

*** Keywords ***
ค้นหาและตรวจสอบคำว่า
    [Arguments]     ${KEYWORD}      ${EXPECT}
    ใส่คำค้นหา      ${KEYWORD}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา       ${EXPECT}

เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=https://google.com  browser=${BROWSER}
ใส่คำค้นหา
    [Arguments]     ${KEYWORD}
    Input Text    name=q   text=${KEYWORD}
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    [Arguments]     ${EXPECT}
    Wait Until Page Contains    text=${EXPECT}
ปิดเว็บเบราว์เซอร์
    Close Browser