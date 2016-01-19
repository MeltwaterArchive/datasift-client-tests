Feature: PUT /pylon/stop

  Scenario: Stop with id
    Given that the request body is valid JSON
    """
      {
        "id": "1234"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/stop"
    Then the response status code should be "204"