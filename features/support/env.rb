require 'selenium-webdriver'
caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: [ "--headless" ]})

Before do
  if ENV["BROWSER"]
    @browser = Selenium::WebDriver.for ENV["BROWSER"].to_sym
    puts @browser.inspect
  else
    @browser = Selenium::WebDriver.for :chrome, desired_capabilities: caps
  end
  @domain = 'https://fullstackautomationwithruby.com'
end
