class WelcomeController < ApplicationController
  def index
    puts "welcome controller index called"
    @users = User.all
    render "index"
  end
end
