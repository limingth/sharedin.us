class PubController < ApplicationController
  def dir
    puts "tag name: " + params[:tagname]
  end
end
