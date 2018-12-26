Feature: FSAR Widget Tests

Scenario Outline: Verify widgets display on the page
  Given I am on the fsar widgets page
  Then I verify widgets display on the page
  And I should see <text> on the page

  Examples:
  | text                 |
  | "Cucumber"           |
  | "Selenium Webdriver" |
  | "SauceLabs"          |
