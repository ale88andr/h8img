class Article < ActiveRecord::Base
	
  belongs_to :user
  belongs_to :category
  has_many :comments
  attr_accessible :body, :title, :views, :user_id, :category_id

  validates :body, presence:{ message:": Это поле должно быть заполненно" }
  validates :title, presence:{ message:": Это поле должно быть заполненно" }, length:{ maximum: 120, too_long: ": Слишком длинное название, придумайте покороче" }

  default_scope order:"created_at DESC"

end
