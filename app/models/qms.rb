class Qms < ActiveRecord::Base
  belongs_to :user
  attr_accessible :message, :recipient

  validates :message, length:{ in:1..750, too_long:'Вы ввели слишком большое сообщение', too_short:'Вы забыли ввести текст' }

  default_scope order:'qms.created_at DESC'
end
