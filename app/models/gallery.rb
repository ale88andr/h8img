class Gallery < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  attr_accessible :image, :image_cache

  validates :image, presence:{ message:": Выберите загружаемый файл" }

  mount_uploader :image, ImageUploader

  default_scope order:"galleries.created_at DESC"

end
