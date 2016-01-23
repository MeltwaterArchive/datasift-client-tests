Feature: PUT /pylon/stop

  Scenario: Stop with name and hash
    Given a stop mock exists
    And returns status code "200" when recording_id "1234" at the path "/behat-v1.3/pylon/stop"
    When a stop request is made with recording_id "1234"
    Then the stop response status code should be "200"
