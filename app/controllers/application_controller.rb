class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  USERS = { BasicAuth.first.user => BasicAuth.first.secret }
  def authenticate
    authenticate_or_request_with_http_digest("DieEwigeListe") do |name|
      USERS[name]
    end
  end
end
