class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(user_attributes)
  	user_attributes.values.each do |user_attribute|

  		if user_attribute.present?
  			user = User.find_or_create_by(:username => user_attribute)
  			user.comments << self
  		end 
  	end
  end

end
