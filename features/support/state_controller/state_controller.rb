# frozen_string_literal: true

module StateController
  class StateSetter
    def self.set_logged_user(login, password)
      Capybara.current_session.driver.browser.manage.delete_all_cookies
      url_login = get_url('url_login')
      uri = URI(url_login)
      headers = get_headers('header_login')
      request = Net::HTTP::Post.new(uri, headers)
      request.content_type = 'application/x-www-form-urlencoded'
      request.set_form_data('email' => login, 'passwd' => password, 'back' => 'my-account', 'SubmitLogin' => '')
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.request(request)
        Capybara.current_session.driver.browser.manage.add_cookie name: response['Set-Cookie'].split('=').first,
                                                                  value: response['Set-Cookie'].split(';').first.split('=').last
      end
      Capybara.page.refresh
    end

    def self.set_cart_status(products, token)
      login_cookie = get_logged_in_cookie
      products.each do |product|
        url_add_product = get_url('url_add_product') + Time.now.to_i.to_s
        uri = URI(url_add_product)
        headers = get_headers('header_add_product', login_cookie)
        request = Net::HTTP::Post.new(uri, headers)
        request.content_type = 'application/x-www-form-urlencoded'
        request.set_form_data(
          'controller' => 'cart',
          'add' => '1',
          'ajax' => 'true',
          'qty' => '1',
          'id_product' => product[:id],
          'token' => token,
          'ipa' => product[:ipa]
        )
        Net::HTTP.start(uri.host, uri.port).request(request)
      end
      Capybara.page.refresh
    end

    def self.get_url(type)
      YAML.load_file(File.dirname(__FILE__) + "/common_data/#{ENVIRONMENT}.yml")[type]
    end

    def self.get_headers(type, login_cookie = nil)
      headers = {}
      header_options = YAML.load_file(File.dirname(__FILE__) + "/common_data/#{ENVIRONMENT}.yml")['headers'][type]
      header_options.each do |option|
        headers.store(option['key'], option['value'])
      end
      headers.store('Cookie', login_cookie) unless login_cookie.nil?
      headers
    end

    def self.get_logged_in_cookie
      found_cookie = Capybara.current_session.driver.browser.manage.all_cookies.find do |cookie|
        cookie[:name].include? 'PrestaShop-'
      end
      "#{found_cookie[:name]}=#{found_cookie[:value]}"
    end
  end
end
