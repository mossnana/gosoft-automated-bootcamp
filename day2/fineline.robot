*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem
Suite Setup     เปิดเว็บเบราว์เซอร์
Suite Teardown  ปิดเว็บเบราว์เซอร์
Test Setup  เข้า All online
Test Template   ค้นหาและตรวจสอบคำว่า

*** Variables ***
${BROWSER}  gc

*** Test Cases ***
ทดสอบค้นหาสินค้าไฟน์ไลน์    ไฟน์ไลน์    ผลการค้นหาสำหรับ »ไฟน์ไลน์« (88 สินค้า)
ทดสอบค้นหาสินค้าช็อกโกแลต    ช็อกโกแลต  ผลการค้นหาสำหรับ »ช็อกโกแลต« (500 สินค้า)

*** Keywords ***
ค้นหาและตรวจสอบคำว่า
    [Arguments]     ${KEYWORD}  ${EXPECT}
    ใส่คำค้นหา      ${KEYWORD}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   ${EXPECT}
เปิดเว็บเบราว์เซอร์
    Open Browser    browser=${BROWSER}
เข้า All online
    Go To    url=https://allonline.7eleven.co.th
ใส่คำค้นหา
    [Arguments]     ${KEYWORD}
    Input Text    name=q   text=${KEYWORD}
กดปุ่ม Enter
    Press Keys    None  RETURN
ตรวจสอบผลการค้นหา
    [Arguments]     ${EXPECT}
    Wait Until Element Contains     xpath=//h1[contains(@class, 'header-category')]    ${EXPECT}
ปิดเว็บเบราว์เซอร์
    Close All Browsers