module UasHelper
  def gravatar_for(user_id)
    user = User.find(user_id)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=50"
    image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
  end 
end
