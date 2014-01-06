class WelcomeController < ApplicationController
  
  def get_connections
    conns = []
    
    current_user.tags.each do |t|
      puts current_user.id 
      puts t.name
      tags = Tag.where(:name => t.name)
      tags.each do |u|
        if u.user_id != current_user.id
         conn = Connection.new(current_user.id, u.user_id, t.name)
         conns += [conn]
        end
      end
    end  
    return conns
  end

  def index
    puts "welcome controller index called"
    @users = User.all
    #@tags = Tag.all
    @tags = Tag.where(:user_id => current_user.id)
    @conns = get_connections
    render "index"
  end

  def conns
    @users = User.all
    @tags = Tag.where(:user_id => current_user.id)
    @conns = get_connections
  end

  def tags
    @users = User.all
    @tags = Tag.where(:user_id => current_user.id)
    @conns = get_connections
  end
end
