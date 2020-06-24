require_relative 'base_page'

class Login < BasePage

  LOGIN_FORM  = { id: 'login' }
  USERNAME_INPUT = { id: 'username' }
  PASSWORD_INPUT = { id: 'password' }
  SUBMIT_BUTTON  = { css: 'button'  }
  SUCCESS_MESSAGE = { css: '.flash.success' }
  FAILURE_MESSAGE = { css: '.flash.error'   }

  def initialize(driver)
    super
    visit '/login'
    raise 'Page not ready' if !is_displayed?(LOGIN_FORM)
  end

  def with(username, password)
    type username, USERNAME_INPUT
    type password, PASSWORD_INPUT
    click SUBMIT_BUTTON
  end

  def success_message?
    wait_for(1) { is_displayed? SUCCESS_MESSAGE }
  end

  def failure_message?
    wait_for(1) { is_displayed? FAILURE_MESSAGE }
  end

end
