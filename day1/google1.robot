*** Settings ***
Library  Collections
Library  SeleniumLibrary
Library    XML

*** Variables ***

*** Test Cases ***
ทดสอบใส่คำค้า PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=https://google.com  browser=gc
ใส่คำค้นหา
    Input Text    name=q   text=PIM
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    Wait Until Page Contains    text=สถาบันการจัดการปัญญาภิวัฒน์
