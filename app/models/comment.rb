class Comment < ActiveRecord::Base
	
  belongs_to :article
  belongs_to :user
  attr_accessible :body, :commenter

  validates :body, presence:{ message:"Это поле должно быть заполненно" }

end
