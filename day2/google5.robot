*** Settings ***
Library  SeleniumLibrary
Test Setup  เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown   ปิดเว็บเบราว์เซอร์

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc

*** Test Cases ***
ทดสอบใส่คำค้นหา
    [Template]  ค้นหาและตรวจสอบคำว่า
    PIM     สถาบันการจัดการปัญญาภิวัฒน์
    CP      พันล้าน
    อาจารย์แดง      กระตุกจิต กระชากใจ

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