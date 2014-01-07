class TagsController < ApplicationController

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
    @tags = Tag.where(:user_id => current_user.id)
    @conns = get_connections
  end

  def create
    tagname = params.require(:tag)[:name].to_s
    tagname.capitalize!
    ret = Tag.where(:user_id => current_user.id).where(:name => tagname)

    if ret.count > 0
      flash[:error] = "Your tag already exists"
      redirect_to :action => :index and return
    end

    @tag = current_user.tags.create(tag_params)
    @tag.name = @tag.name.capitalize
    if @tag.valid?
      flash[:success] = "Your tag was shared"
      redirect_to :action => :index and return
    else
      get_tags
      flash[:error] = "Your tag could not be saved"
#      render :action => :index and return
    end
  end

  def show
    puts "show"
    @tagname = params[:tagname]
    @tagname.capitalize!
    @rets = Tag.where(:name => @tagname)
    render '/tags/search'
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
