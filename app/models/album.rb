class Album < ActiveRecord::Base
  has_many :galleries
  attr_accessible :name

  validates :name, presence:{:message => ": Это поле необходимо заполнить"}

  default_scope order: "albums.created_at DESC"
end
