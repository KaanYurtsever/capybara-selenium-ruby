Feature: login with desired credentials for istegelsin page

  Background:
    Given User opens browser and goes to the homepage

  @first
  Scenario: Add product to the cart with login user
    When User logins with "5468292270" number to the homepage successfully
    Then User searches the desired product "elma"
    And User filters the desired product by "Fiyatı Artan" and add first product to the cart
    And User sees that the searched product added to the cart

  @second
  Scenario: User logins to the homepage unsuccessfully
    When User logins with "5555555554"
    Then User writes to the OTP field with wrong OTP "1111"
    And User sees that couldnt login successfully
