# frozen_string_literal: true

After do |scenario|
  if scenario.failed?
    screenshot = Capybara.page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
    attach(screenshot, 'image/png')
  end
  unless PARALLEL
    Capybara.reset_session!
    Capybara.current_session.driver.quit
  end
end

if PARALLEL
  require 'parallel_tests'
  ParallelTests.first_process? ? sleep(10) : sleep(1)

  at_exit do
    if ParallelTests.first_process?
      ParallelTests.wait_for_other_processes_to_finish
      Capybara.current_session.driver.quit
    end
  end
end
