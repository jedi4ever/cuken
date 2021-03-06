@announce
Feature: Interactive process control

  In order to test interactive command line applications
  As a developer using Cucumber
  I want to use the interactive session steps
  @ssh_remote
  Scenario: Running ruby interactively
    Given the file "echo.rb" contains:
      """
      while res = gets.chomp
        break if res == "quit"
        puts res.reverse
      end
      """
    When I interactively run `ruby echo.rb`
    And I type "hello, world"
    And I type "quit"
    Then the output contains:
      """
      dlrow ,olleh
      """

  Scenario: Running a native binary interactively
    When I interactively run `bc -q`
    And I type "4 + 3"
    And I type "quit"
    Then the output should contain:
      """
      7
      """

  Scenario: Running interactively in a directory outside Aruba's scratch
    When I interactively run `echo 'correct' >discovered.txt` in "/tmp"
    When I run `cat /tmp/discovered.txt`
    Then the output contains:
      """
      correct
      """
     And the file "discovered.txt" does not exist

  Scenario: Running successfully in a directory outside Aruba's scratch
    When I successfully run `echo 'correct2' >discovered.txt` in "~/tmp/"
    When I run `cat ~/tmp/discovered.txt`
    Then the output contains:
      """
      correct2
      """
     And the file "discovered.txt" does not exist

  Scenario: Stop processes before checking for filesystem changes 
    See: http://github.com/aslakhellesoy/aruba/issues#issue/17 for context

    Given a directory named "rename_me"
    When I interactively run `mv rename_me renamed`
    Then a directory named "renamed" should exist
    And a directory named "rename_me" should not exist
