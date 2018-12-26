class WidgetsIndex

  def initialize(browser, domain)
    @browser = browser
    @domain = domain
  end

  def visit
    @browser.get(@domain + "/widgets")
  end

end
