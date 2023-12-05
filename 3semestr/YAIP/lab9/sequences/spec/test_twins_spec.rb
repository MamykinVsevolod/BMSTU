require 'rails_helper'

require "json"
require "selenium-webdriver"
require "rspec-rails"

include RSpec::Expectations

describe "BaseTwinsTest" do

  before(:each) do
    @driver = Selenium::WebDriver.for :edge
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    expect(@verification_errors).to match_array([])
  end

  it "test_base_twins" do
    values = %w[20 30 1]
    targets = [[29, 31],
               [41, 43],
               [],
    ]

    values.length.times do |i|
      val = values[i]
      target = targets[i]

      @driver.get "http://127.0.0.1:3000/"
      @driver.find_element(:xpath, "//*/text()[normalize-space(.)='']/parent::*").click
      @driver.find_element(:id, "n").click
      @driver.find_element(:id, "n").clear
      @driver.find_element(:id, "n").send_keys val
      @driver.find_element(:xpath, "//form[@id='calc_form']/button").click

      # Обрабатываем результат
      element = @driver.find_element(:id, 'result')

      # Ждем, пока элемент не появится
      @wait.until { @driver.find_element(:id, 'date').displayed? }

      text = element.text.split[1..]
      puts text, "\n"

      arr = []
      text.each do |num|
        break unless Integer(num, exception: false)
        arr << num.to_i
      end

      pp arr

      verify { expect(arr).to match_array(target) }
    end
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to.alert
    alert_text = alert.text
    if @accept_next_alert
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
