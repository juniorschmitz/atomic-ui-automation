# frozen_string_literal: true

module Authentication
  class LoginForm < SitePrism::Section
    element  :input_email, '#email'
    element  :input_password, '#passwd'
    element  :btn_signin, '#SubmitLogin'
  end
end
