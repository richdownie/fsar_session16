require 'selenium-webdriver'
require 'webdrivers'
require 'cucumber'
require 'rspec'
require 'pry'
require 'httparty'
require_relative '../page_objects/widgets_index_page'

Before do
  @widgets_index = WidgetsIndex.new(@browser, @domain)
end
