class Category < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :articles

  # Валидаторы
  validates :title, presence: { message:": Это поле должно быть заполненно" }, length: { maximum:80, too_long:": Это поле не должно превышать 80 символов" }, uniqueness:{ message:": Такое название категории уже существует" }
  validates :description, length: { :in => 1..500, too_long:": Слишком длинное описание, поле не должно превышать 500 символов", too_short:": поле должно быть заполненно" }
end
