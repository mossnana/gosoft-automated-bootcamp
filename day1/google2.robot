*** Settings ***
Library  Collections
Library  SeleniumLibrary
Library    XML

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc
${KEYWORD}  PIM
${EXPECT}   สถาบันการจัดการปัญญาภิวัฒน์

*** Test Cases ***
ทดสอบใส่คำค้า PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}  browser=${BROWSER}
ใส่คำค้นหา
    Input Text    name=q   text=${KEYWORD}
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    Wait Until Page Contains    text=${EXPECT}
