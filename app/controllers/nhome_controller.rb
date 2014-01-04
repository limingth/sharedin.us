class NhomeController < ApplicationController
  def create
    puts params[:firstName]
    puts params[:lastName]
    puts params[:email]
  end
end
