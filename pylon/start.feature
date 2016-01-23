Feature: PUT /pylon/start

  Scenario: Start with name and hash
    Given a start mock exists
    And returns start body and status code "200" at the path "/behat-v1.3/pylon/start"
    """
      {
          "id": "1234"
      }
    """
    When a start request is made with hash "1234" and name "name"
    Then the start response status code should be "200"
    And the start response body contains the JSON data
    """
      {
          "id": "1234"
      }
    """