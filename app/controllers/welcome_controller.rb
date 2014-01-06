class WelcomeController < ApplicationController
  def index
    puts "welcome controller index called"
    @users = User.all
    render "index"
  end

  def conns
    @conns= []
    
    current_user.tags.each do |t|
      puts current_user.id 
      puts t.name
      @tags = Tag.where(:name => t.name)
      @tags.each do |u|
        if u.user_id != current_user.id
	  @conn = Connection.new(current_user.id, u.user_id, t.name)
          @conns += [@conn]
        end
      end
    end

  end

end
