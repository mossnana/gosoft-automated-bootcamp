*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc

*** Test Cases ***
ทดสอบใส่คำว่า PIM ควรเจอคำว่า สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา  PIM
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำว่า CP ควรเจอคำว่า พันล้าน
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา  CP
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   พันล้าน

ทดสอบใส่คำว่า อาจารย์แดง ควรเจอคำว่า กระตุกจิต กระชากใจ
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา  อาจารย์แดง
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   กระตุกจิต กระชากใจ

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}  browser=${BROWSER}
ใส่คำค้นหา
    [Arguments]     ${KEYWORD}
    Input Text    name=q   text=${KEYWORD}
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    [Arguments]     ${EXPECT}
    Wait Until Page Contains    text=${EXPECT}
