# Atomic UI Automation

This project was created for showing patterns that can help in reducing test automation flakiness and time for execution. The main pattern that helps in creating atomic UI scenarios is the application StateController.

In the StateController, we can login and set the login cookies in the application without having to go through the UI, and also, we can add products in the shopping cart without having to do all steps through the application UI. We do these actions by replacing UI actions for directly calling the application form submissions using the desired information.

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

For installing the project needed gems, one should:
```
bundle install
```

For running all tests, one should:
```
bundle exec cucumber -p default -t@full_regression
```

Where the tag @full_regression is, one could replace it with any Cucumber tag for running specific features or scenarios.

For running the project in headless mode, one could add the "-p headless" flag into the execution command, for example:
```
bundle exec cucumber -t@search_existent_product -p headless
```

Without the StateController modification, the project was already optimized, but it used to took *5~6 minutes* for running all 25 scenarios.

With the StateController modification, the project now runs the same scenarios but in *3~4 minutes*.

Atomic tests *must* be parallelized, the maximum duration of test duration can be the maximum duration of the slowest scenario if parallelization is applied as it has to be with good practices.

This project need a single upgrade for parallelizing scenarios without making race conditions between user sessions, it must be the last update for a great example on atomic ui scenarios, and is going to be implemented in the near future.

Any doubts, feel free to contact me.
