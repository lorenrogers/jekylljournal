Feature: Prepend yaml to posts

  Posts should have yaml frontmatter prepended to them.

  Background:
    Given a valid dotfile exists

  Scenario: Create a new post with default yaml
    Given the blog post for today does not exist
    When I run `jekylljournal`
    Then it should create the post for today
    And the file should have the default yaml frontmatter
