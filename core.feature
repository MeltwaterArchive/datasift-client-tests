Feature: Core

  Scenario Outline:
    Given CSDL to validate like <CSDL>
    When I call the validate endpoint
    Then I should get a validation with a dpu cost

    Examples:
      | CSDL                                 |
      | 'interaction.sample < 1' |

  Scenario Outline:
    Given CSDL to compile like <CSDL>
    When I call the compile endpoint
    Then I should get a compilation with a hash

    Examples:
      | CSDL                                 |
      | 'interaction.sample < 2' |

  Scenario:
    When I call the usage endpoint
    Then I should get back account usage

  Scenario Outline:
    Given a hash like <hash>
    When I call the dpu endpoint
    Then I should get a dpu cost

    Examples:
      | hash                               |
      | 'c8ad285e200a0e9a4b8737ee43676599' |

