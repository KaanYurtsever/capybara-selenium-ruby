begin
  class BasketPage

    def initialize
      @product_title_on_cart = "//div[@class='prod-title']//span"
    end

    def check_desired_product_added_successfully
      sleep(15)
      product_title_on_cart = find(@product_title_on_cart).text
      puts("product_title_on_cart: " + product_title_on_cart)
      expect($first_product_text).to eq(product_title_on_cart)
    end
  end

end