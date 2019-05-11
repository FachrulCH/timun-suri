Feature: Feature name

  Feature Description

  Scenario: Explorer
    Given user is opening Instagram homescreen
    And user open explore

  Scenario: Scenario likers
    Given user is opening Instagram homescreen
    When user searching for following data:
      | keywords | numer_of_likes |
      | #Jakarta | 5              |
      | Bandung  | 35             |
