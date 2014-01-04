class UasController < ApplicationController

  def index
    puts "index called"

    puts "user email :" + params[:session_key]

  end

  def login

    print "login submit"
    
  end

end
