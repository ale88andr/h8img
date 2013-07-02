class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  has_many :articles
  has_many :comments
  has_many :galleries
  has_many :albums
  has_many :microposts, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :user_burn, :user_country, :show_email, :user_about, :user_sex, :user_avatar, :user_avatar_cache
  # attr_accessible :title, :body
  validates :username, uniqueness: { case_sensitive:false, message: ': В нашей базе уже есть такое имя, придумайте, пожалуйсто, другое' }, length: { in: 3..25, too_short: ': Должно состоять не менее чем из 3 символов', too_long:': Должно быть не более 25 символов' }, format: { with: /^[a-zA-Z][-a-zA-Z0-9!#$&'*+=?^_{|}~]*$/, message: ': Это поле должно содержать символы латинского алфавита, цифры либо знаки - !#$%&*+=?^_{|}~' }
  validates :email, uniqueness: { case_sensitive:false, message: ': В нашей базе уже есть такой электронный адрес' }, format: { with: /^[a-zA-Z]([-a-zA-Z0-9!#$&'*+=?^_{|}~])*@[a-z0-9]+.[a-z]{0,4}$/, message: ': Вы ввели неверный электронный адрес, email должен быть следующего формата: username@hostname.com' }
  validates :password, length: { minimum: 8, too_short: ': Должен состоять не менее чем из 8 символов' }, :on => :create
  validates :password_confirmation, length: { minimum: 8, too_short: ': Должен состоять не менее чем из 8 символов' }, :on => :create

  mount_uploader :user_avatar, UserAvatarUploader
end
