@chef @cookbook @step_features
Feature: Cookbook steps
  In order to test automated Chef deployments
  As an administrator
  I want to know what Cookbook steps are available

  Background:
    Given that "cuken/chef" has been required

  Scenario: Cookbook action steps
    Then these steps are defined for "cuken/cucumber/chef/cookbook/action.rb":
      | step                                                                |
      |I clone the remote Cookbook repository branch "([^"]*)" to "([^"]*)" |
      |I clone the Cookbook "([^"]*)" branch "([^"]*)" to "([^"]*)"         |
      |I clone the Cookbooks:                                               |
      |I load the Cookbooks:                                                |
      |I successfully generate all Cookbook metadata                        |
      |I successfully generate Cookbook "([^"]*)" metadata                  |

  Scenario: Local Cookbook and repository commands
    Then these steps are defined for "cuken/cucumber/chef/cookbook/local.rb":
      | step                                                                |
      |a Cookbook path "([^"]*)"                                            |
      |a Cookbooks path "([^"]*)"                                           |
      |the local Cookbook "([^"]*)" exists                                  |
      |the local Cookbook repository "([^"]*)"                              |
      |the local Cookbook repository exists                                 |
      |the local Site\-Cookbook "([^"]*)" exists                            |
      |the local Site\-Cookbook repository exists                           |
      |these local Cookbooks exist:                                         |
      |these local Cookbooks no not exist:                                  |
      |these local Site\-Cookbooks exist:                                   |

  Scenario: Remote Cookbook and repository commands
    Then these steps are defined for "cuken/cucumber/chef/cookbook/remote.rb":
      | step                                                                |
      |the remote Cookbook repository "([^"]*)"                             |
      |the remote Cookbooks URI "([^"]*)"                                   |
      |these remote Cookbooks exist:                                        |
      |these remote Cookbooks do not exist:                                 |

