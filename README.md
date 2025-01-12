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

# Day 2
Robot Framework (**Flow Based Testing**)
## Test Scenario
1 Senario ต่อ 1 User ที่ใช้ทดสอบ

### Components
- Arrange (Library, Data)
- Act
- Expected Result

## Documents
- Specifications
- Wireframe
- Figma Design

## Libraries
- ไม่ค่อยแนะนำให้ใช้ AppiumLibrary มันจะบวมขึ้นเรื่อยๆแล้วจะช้ามาก ให้ไปใช้เครื่องมือ Test ของตัวเอง

## Project Structure
- Story (or Service)
  - UI
    - Success Cases
    - Failed Cases
  - API
    - Success Cases
    - Failed Cases

## คำแนะนำ
- แนะนำให้ตั้ง Expected Result ในชื่อ Test Case เลย
- แนะนำให้ทุกคนในทีมดู Report HTML แทนการให้ QA ไปทำ Report เอง เพื่อประหยัดเวลาตัว QA เอง
- ถ้าแอปมีการ 2FA ให้ Programmer ทำการ Bypass หรือสร้าง User ที่ไม่ต้อง 2FA เพื่อประหยัดเวลา QA เอง (เพราะเรา Focus ที่ Logic หลัง Authentication)
- หน้าที่การทดสอบ Validate fields เป็นหน้าที่ของ Frontend ให้ Robot ไปทดสอบ Business Flow แทนดีกว่า
- แนะนำให้ใช้ข้อมูล UAT เป็นหลักในการทดสอบ SIT,local,Production
- แนะนำให้ทำ Feature ที่กระทบ Business ก่อนเช่นการจ่ายเงิน โดยข้าม Login ไปก่อน

## Specification
- Rule (test cases) most clarify, most stability (robot files)
- Workflow (test cases) (robot files)
- Technical Activity (keyword) (resource files)