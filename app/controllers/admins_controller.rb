class AdminsController < ApplicationController
  USERS = { "Sepp1314" => "123*#abc" }
 
  before_action :authenticate
 
  private
 
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end