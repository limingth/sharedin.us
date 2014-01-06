module TagsHelper
  def get_tag_count(tag_name)
    #tag_name.to_s.length
    all_selected_tags = Tag.where(:name => tag_name)
    all_selected_tags.count
  end

  def get_tag_users(tag_name)
  	names = "=> "
  	all_selected_tags = Tag.where(:name => tag_name)
  	all_selected_tags.each do |t|
  		names += get_user_name(t.user_id) + ", "
  	end
  	return names
  end
end
