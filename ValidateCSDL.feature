Feature: Core

  Scenario Outline:
    Given CSDL to validate like 'interaction.content contains "moo"
    When I call the validate endpoint
    Then I should get a validation with a dpu cost
