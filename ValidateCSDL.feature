Feature: Validate CSDL
  Ensure that we can validate CSDL

  Scenario: A valid user can validate CSDL
    Given A valid username and API key
    When I call validate
    Then I should get back a validation response
