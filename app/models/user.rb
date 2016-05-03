class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :exercises
  
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            length: { maximum: 125 },
            format: { with: VALID_EMAIL_REGEX }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  self.per_page = 2
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
