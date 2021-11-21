# Atomic UI Automation

[![Linter CI](https://github.com/juniorschmitz/atomic-ui-automation/actions/workflows/main.yml/badge.svg)](https://github.com/juniorschmitz/atomic-ui-automation/actions/workflows/main.yml)

This project was created for showing patterns that can help in reducing test automation flakiness and time for execution. The main pattern that helps in creating atomic UI scenarios is the application StateController.

In the StateController, we can login and set the login cookies in the application without having to go through the UI, and also, we can add products in the shopping cart without having to do all steps through the application UI. We do these actions by replacing UI actions for directly calling the application form submissions using the desired information.

The System Under Test (SUT) used for creating this example on atomic ui testing strategy was the Selenium Automation Practice website, which can be found at: [Automation Practice](http://automationpractice.com/index.php)

The project without atomic modifications, which used end to end strategy for all scenarios can be found at: [E2E Starter Project](https://github.com/juniorschmitz/e2e-web-test-automation)

### Project stacks and patterns

The project uses the following stack:
- Ruby language;
- Capybara gem;
- SitePrism gem;
- RSpec gem;
- Rubocop gem as linter;

The project uses the following patterns:
- PageObject pattern for dealing with the Web application pages and elements mapping;
- Data Factory pattern for dealing with test data;
- State controller pattern for dealing with the application states;

### How to execute the project

The project uses bundler as the default Ruby package manager, and Cucumber as the tests executor.

For installing the project needed gems, one should:
```
bundle install
```

For running all tests sequentially, one should:
```
bundle exec cucumber -p default -t@full_regression
```

Where the tag @full_regression is, one could replace it with any Cucumber tag for running specific features or scenarios.

For running the project in headless mode, one could add the "-p headless" flag into the execution command, for example:
```
bundle exec cucumber -t@search_existent_product -p headless
```

If ou would like to run all scenarios using parallelization, you can run:
```
bundle exec parallel_cucumber -n <threads_number> -o '-p default_parallel -p headless -t@full_regression'
```

Since the parallelization is made under feature file levels, it was testes using 3 and 4 threads, but you can increase more as needed.

### Differences after atomic ui project modifications

Without the StateController modification, the project was already optimized, but it used to took __5~6 minutes__ for running all 25 scenarios.

With the StateController modification, the project now runs the same scenarios but in __3~4 minutes__,

### About parallelization

Atomic tests __must__ be parallelized, the maximum duration of test duration can be the maximum duration of the slowest scenario if parallelization is applied as it has to be with good practices.

After adding parallelization to the project, it was possible to run all 25 scenarios under __1 minute__.

Any doubts, feel free to contact me.
