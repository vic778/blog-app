class ApplicationController < ActionController::Base
  def current_user
    User.third
  end
end
