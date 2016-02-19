Feature: Read the app configuration from a file
  In order to make individual installations flexable,
  I want to be able to configure all the instance
  variables using a central dotfile.

  Scenario: No dotfile
    Given a file named "~/.jekylljournal.yaml" does not exist
    When I run `jekylljournal`
    Then the output should contain:
    """
    Config file not found, please create one.
    """

  Scenario: Empty dotfile
    Given a file named "~/.jekylljournal.yaml" with:
    """
    """
    When I run `jekylljournal`
    Then the output should contain:
    """
    Config file empty, please see the readme.
    """

  Scenario: Get blog dir from dotfile
    Given a file named "~/.jekylljournal.yaml" with:
    """
    :blog_location: /home/lorentrogers/journal
    """
    When I run `jekylljournal`
    Then the output should contain:
    """
    The blog location is /home/lorentrogers/journal
    """
