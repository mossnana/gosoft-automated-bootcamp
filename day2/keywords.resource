*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}  https://google.com
${BROWSER}  gc

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
