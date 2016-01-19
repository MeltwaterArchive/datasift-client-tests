Feature: PUT /pylon/start

  Scenario: Start with name and hash
    Given that the request body is valid JSON
    """
      {
        "name": "abc",
        "hash": "83fa8c8f21c44698be111fa0c1372a40"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/start"
    Then the response status code should be "200"
    And the response body contains the JSON data
    """
      {
        "id": "1234"
      }
    """