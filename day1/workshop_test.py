import pytest
from selenium.webdriver.chrome import webdriver

import workshop

class TestWorkshop:
    def test_sum(self):
        assert workshop.sum(1,2) == 3

    def test_multiple(self):
        assert workshop.multiply(1,2) == 2

    def test_capital_word(self):
        assert workshop.capital_word('love') == 'Love'
        assert workshop.capital_word('Like') == 'Like'
        assert workshop.reversed_word('nich') == 'hcin'

class TestSeleniumWorkshop:
    @pytest.fixture(autouse=True)
    def browser_setup_and_teardown(self):
        self.use_selenoid = False  # set to True to run tests with Selenoid

        if self.use_selenoid:
            self.browser = webdriver.Remote(
                command_executor='http://localhost:4444/wd/hub'
            )
        else:
            self.browser = webdriver.Chrome()

        self.browser.maximize_window()
        self.browser.implicitly_wait(10)
        self.browser.get("https://www.jetbrains.com/")

        yield

        self.browser.close()
        self.browser.quit()
