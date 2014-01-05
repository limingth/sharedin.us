class Tag < ActiveRecord::Base

  belongs_to :user

  def self.by_user_ids(*ids)
    where(:user_id => ids.flatten.compact.uniq).order('created_at DESC')
  end 

end
