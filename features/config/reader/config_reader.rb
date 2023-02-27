module ConfigReader

  @prod_url =  "https://www.istegelsin.com"
  def self.prod_url
    @prod_url
  end

  @browser = 'chrome'
  def self.browser
    @browser
  end

  @wait_time = 20
  def self.wait_time
    @wait_time
  end

end