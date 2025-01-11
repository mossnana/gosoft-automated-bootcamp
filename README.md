# Gosoft Automated Tester Bootcamp

## Topics (Day 1)
### SDLC (Focus on Testing)

<figure>
  <img src="https://cms-cdn.katalon.com/large_Software_Testing_Life_Cycle_Inline1_1_c928b66501.png" alt="Software Testing Life Cycle"/>
  <figcaption>Software Testing Life Cycle (Thank you katalon for image)</figcaption>
</figure>

- จะมี Automate Test ต้องทำ Manual Test ก่อน
- ขั้นตอนที่ 3. คือขึ้นตอนการเตรียม Test Script
- การทดสอบควรมีขั้นตอนการเตรียมข้อมูลไว้เสมอในทุกการทดสอบเพื่อกันการทดสอบ failed จากข้อมูลที่ไม่พร้อม
- ยกตัวอย่างรูปแบบการพัฒนาซอฟต์แวร์ที่ช่วยทำให้กระบวนการทดสอบแข็งแรง
    - TDD
    - BDD โฟกัสที่พฤติกรรมของคนใช้งานเพื่อให้ได้ Requirement, Acceptance Criteria ที่ตรงกับความต้องการผู้ใช้มากที่สุด
- As a ...{role}..., I want ...{goal}..., So that ...{benefit}... อาจจะใช้ไม่ได้สำหรับการอธิบาย Story หนึ่งๆ เนื่องมาจากหลายปัจจัย เช่น ในการพัฒนา Software หนึ่งๆ Story หนึ่งๆ การอธิบายแค่ประโยคเดียว อาจจะไม่ครอบครุมกับ Requirement

### Basic Python and Pytest
- สอน Basic Python และ Pytest

### Introduction to Selenium with Python
- ลง Selenium และ Webdriver
- สอนเขียน Library Selenium ผ่าน Python
    - เปิด Chrome
    - การ Locate element
    - Search with google
    - Search in ALL-Online 7-11 Website

### Introduction to Robot Framework with Selenium
- มักมีคำเข้าใจผิดว่า Selenium กับ Robot Framework อยู่ด้วยกันโดยเริ่มต้น
- ส่วนต่างๆของ Robot Framework (Settings, Variables, Test Cases และ Keywords) มีหน้าที่อะไร
- สอนการใช้คำสั่งต่างๆ ใน SeleniumLibrary บน Robot Framework
- แนะนำให้เขียน Business case ใน Test Cases และเขียนรายละเอียดการทำงานของแต่ละ Test Case ใน Keywords
