begin
  class SearchPage < HomePage

    def initialize
      @searched_products_name = "//p[@class='no-result-desktop-text']//span"
      @filter_option = "//select[@class = 'ig-control-inp']"
      @add_basket_button = "(//button[@id='undefined_showAllButton'])[1]"
      @basket_button = "//div[@class = 'basket-box']"
      @go_to_basket_button = '.go-to-basket-wrapper'
      @product_title = "(//div[contains(@class, 'DefaultCard_productCard_Prices')]/following-sibling::div)[1]"
      @go_to_cart_btn = "//button[text()='Sepete Git']"
    end

    def check_searched_product_listed_correctly
      find(@searched_products_name).text.should have_text($product_name)
    end

    def make_desired_filter(filter_name)

      find(@filter_option).find(:option, filter_name).select_option
      #page.select 'Fiyatı Artan', from: @filter_option
      #dropdown = find(@filter_option)
      #option = Selenium::WebDriver::Support::Select.new(dropdown)
      #option.select_by(:value, "1")
      sleep(5)
    end

    def add_first_product_to_the_cart
      $first_product_text = find(@product_title).text
      puts("added product name: " + $first_product_text)
      sleep(5)
      find(@add_basket_button).click
    end

    def go_to_the_basket_page
      find(@basket_button).click
      find(@go_to_cart_btn).click
    end

  end
end