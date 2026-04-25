Feature: Checkout

  Scenario: Registered user completes checkout
    Given the user has items in the cart
    When they complete checkout with a valid card
    Then an order confirmation is shown
