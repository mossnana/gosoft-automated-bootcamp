import time

import pytest
from selenium import webdriver
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

class TestSelenium:
    @pytest.fixture(autouse=True)
    def browser_setup_and_teardown(self):
        self.browser = webdriver.Chrome()
        yield
        self.browser.close()

    @pytest.mark.skip
    def test_open_browser(self):
        self.browser.get("https://youtube.com")
        assert self.browser.title == 'YouTube'

    @pytest.mark.skip
    def test_browser_size(self):
        self.browser.maximize_window()
        self.browser.minimize_window()

    @pytest.mark.skip
    def test_search(self):
        self.browser.get('https://google.com')
        wait = WebDriverWait(self.browser, 10)
        search_bar = wait.until(EC.presence_of_element_located((By.NAME, 'q')))
        assert search_bar is not None
        search_bar.send_keys('PIM')
        search_bar.submit()
        wait.until(EC.presence_of_element_located((By.ID, 'search')))

    @pytest.mark.skip
    def test_search_by_xpath(self):
        self.browser.get('https://google.com')
        search_bar_xpath = self.browser.find_element(By.XPATH, "//textarea[@name='q']")
        search_bar_xpath.send_keys('XPath Example')
        search_bar_xpath.submit()
        wait = WebDriverWait(self.browser, 10)
        wait.until(EC.presence_of_element_located((By.ID, 'search')))

    @pytest.mark.skip
    def test_search_all_online(self):
        keyword = 'ไฟน์ไลน์'
        expect_count = 88
        self.browser.get('https://allonline.7eleven.co.th')
        search_box = self.browser.find_element(By.NAME, 'q')
        search_box.send_keys(keyword)
        search_box.submit()

        search_result = self.browser.find_element(By.XPATH, "//h1[contains(@class, 'header-category')]")
        assert search_result.text == f'ผลการค้นหาสำหรับ »{keyword}« ({expect_count} สินค้า)'
