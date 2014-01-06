class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def create
    @tags = Tag.all
  end

  def create
    @tag = current_user.tags.create(tag_params)
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
    puts params[:tagname]
    @tagname = params[:tagname]
    @rets = Tag.where(:name => @tagname)
    render '/tags/search'
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
