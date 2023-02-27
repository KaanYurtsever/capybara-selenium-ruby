begin
  class HomePage

    def initialize
      @next_btn = "//div[contains(@class, 'ProductTour_ListingDesktop')]//button[@id = 'undefined_showAllButton']"
      @ok_btn_on_product_tour = "//div[contains(@class, 'ProductTour_BasketDesktop')]//button[@id = 'undefined_showAllButton']"
      @istegelsin_logo = "//a[@class = 'logo']"
      @later_btn = "//div[@class = 'dn-slide-buttons horizontal']//button[text()='Daha Sonra']"
      @login_or_be_member_btn = "//span[text()='Giriş Yap veya Üye Ol']"
      @phone_number_field = "//input[@placeholder='Telefon Numaran']"
      @continue_btn = "//button[text()='Devam Et']"
      @start_shopping_btn = "//button[text()='Alışverişe Başla']"
      @close_permission_btn = "//img[@alt='closer icon']"
      @address_capsule = "//div[@class='capsule slot']"
      @search_field = "//div[@class='search-box']//input"
      @search_btn = "//img[@alt='search icon']"
      @otp_field = "(//input[@class='otp-inp'])[1]"
      @error_msg_on_otp_screen = "//p[text()='Hatalı doğrulama kodu girdin.']"
      @error_msg_txt = "Hatalı doğrulama kodu girdin."
    end

    def go_to_home_page
      visit ConfigReader.prod_url
    end

    def check_home_page_is_opened
      expect(page).to have_xpath(@istegelsin_logo)
    end

    def skip_product_tour
      find(@next_btn).click
      find(@next_btn).click
      find(@ok_btn_on_product_tour).click
    end

    def close_popup
      find(@later_btn).click
    end

    def login_with_phone_number(phone_number)
      find(@login_or_be_member_btn).click
      find(@phone_number_field).send_keys(phone_number)
      find(@continue_btn).click
      sleep(12)
    end

    def close_login_popups
      find(@start_shopping_btn).click
      find(@close_permission_btn).click
    end

    def check_login_successfully
      expect(page).to have_xpath(@address_capsule)
    end

    def attempt_login_with_wrong_otp(wrong_otp)
      find(@otp_field).click
      find(@otp_field).set(wrong_otp)
      find(@start_shopping_btn).click
    end

    def search_product(product)
      $product_name = product
      find(@search_field).click
      find(@search_field).send_keys(product)
      find(@search_btn).click
    end

    def check_login_unsuccessfully
      error_msg = find(@error_msg_on_otp_screen).text
      puts("Error message: " + error_msg)
      expect(error_msg).to eq(@error_msg_txt)
    end

  end
end