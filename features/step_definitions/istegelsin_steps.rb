begin

  home_page = HomePage.new
  search_page = SearchPage.new
  basket_page = BasketPage.new

  Given('User opens browser and goes to the homepage') do
    home_page.go_to_home_page
    home_page.check_home_page_is_opened
    home_page.skip_product_tour
    home_page.close_popup
  end

  When('User logins with {string} number to the homepage successfully') do |phone_number|
    home_page.login_with_phone_number(phone_number)
    home_page.close_login_popups
    home_page.check_login_successfully
  end

  Then('User searches the desired product {string}') do |product|
    home_page.search_product(product)
    search_page.check_searched_product_listed_correctly
  end

  Then('User filters the desired product by {string} and add first product to the cart') do |filter_name|
    search_page.make_desired_filter(filter_name)
    search_page.add_first_product_to_the_cart
  end

  Then('User sees that the searched product added to the cart') do
    search_page.go_to_the_basket_page
    basket_page.check_desired_product_added_successfully
  end

  When('User logins with {string}') do |phone_number|
    home_page.login_with_phone_number(phone_number)
  end

  Then('User writes to the OTP field with wrong OTP {string}') do |wrong_otp|
    home_page.attempt_login_with_wrong_otp(wrong_otp)
  end

  Then('User sees that couldnt login successfully') do
    home_page.check_login_unsuccessfully
  end

end