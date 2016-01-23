Feature: PUT /pylon/update

  Scenario: Update with valid parameters
    Given a update mock exists
    And returns status code "200" when query string "id=1234&hash=83fa8c8f21c44698be111fa0c1372a40&name=abc" at the path "/behat-v1.3/pylon/update"
    When an update request is made with recording_id "1234", hash "83fa8c8f21c44698be111fa0c1372a40" and name "abc"
    Then the response status code should be "200"

  Scenario: Update without id
    Given a update mock exists
    And returns update error "No id was supplied." and status code "400"
    When a update request is made with no recording_id, hash "83fa8c8f21c44698be111fa0c1372a40" and name "abc"
    Then the update response status code should be "400"
    And the update response body contains the JSON data
    """
      {
        "error": "No id was supplied."
      }
    """

  Scenario: Update without hash
    Given a update mock exists
    And returns status code "200" when query string "id=1234&name=abc" at the path "/behat-v1.3/pylon/update"
    When an update request is made with recording_id "1234" and name "abc"
    Then the update response status code should be "200"

  Scenario: Update without name
    Given a update mock exists
    And returns status code "200" when query string "id=1234&hash=83fa8c8f21c44698be111fa0c1372a40" at the path "/behat-v1.3/pylon/update"
    When an update request is made with recording_id "1234" and hash "abc"
    Then the update response status code should be "200"

  Scenario: Update without hash or name
    Given a update mock exists
    And returns status code "200" when query string "id=1234" at the path "/behat-v1.3/pylon/update"
    When an update request is made with recording_id "1234", no hash or name
    Then the update response status code should be "400"
    And the update response body contains the JSON data
    """
      {
        "error": "No id was supplied."
      }
    """