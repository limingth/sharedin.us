module HomeHelper

  # Returns the authenticated user if one is logged in, or a blank new user if not.
  #
  def resource
    current_user || User.new
  end

  def get_user_name(id)
    user = User.where(:id => id).first 
    if user != nil
    	return user.firstname.to_s + "." + user.lastname.to_s
    else
    	return ""
    end
  end 

end
