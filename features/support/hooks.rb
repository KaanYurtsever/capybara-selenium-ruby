Before do |scenario|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--ignore-certificate-errors')

   Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :"#{ConfigReader.browser}",
                                   options: options)
  end
end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, "").gsub(/\s+/, "_")
  if scenario.failed?
    time = Time.new
    time_day = time.strftime("%Y-%m-%d")
    time_hours = time.strftime("%H-%M-%S")
    file_path = "output/screenshots-#{time_day}"
    screenshot = "#{file_path}/#{scenario_name}-#{time_hours}.png"
    page.save_screenshot(screenshot)

    # https://github.com/allure-framework/allure-ruby/tree/master/allure-cucumber
    Allure.add_attachment(name: "Fail Screenshot", source: File.open("#{screenshot}"), type: Allure::ContentType::PNG, test_case: true)

  else
    puts("Test Passed")
  end
  Capybara.current_session.driver.quit
end