*** Settings ***
Resource    keywords.resource
Suite Setup  เปิดเว็บเบราว์เซอร์
Suite Teardown   ปิดเว็บเบราว์เซอร์
Test Setup  เข้า Google
Test Template   ค้นหาและตรวจสอบคำว่า

*** Test Cases ***
ทดสอบใส่คำว่า PIM ควรเจอคำว่า สถาบันการจัดการปัญญาภิวัฒน์   PIM     สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำว่า CP ควรเจอคำว่า พันล้าน    CP      พันล้าน
ทดสอบใส่คำว่า อาจารย์แดง ควรเจอคำว่า กระตุกจิต กระชากใจ   อาจารย์แดง      กระตุกจิต กระชากใจ