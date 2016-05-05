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
  has_many :friendships
  
  # Make sure to specify what class is referred to
  has_many :friends, through: :friendships, class_name: "User"
  
  self.per_page = 8
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.search_by_name(name)
    names_array = name.split(' ')
    # Only first or last name was entered, thus 1
    if names_array.size == 1
      where('first_name LIKE ? or last_name LIKE ?',
      # Assigning whatever is in 1st or 2nd position to the LIKES
      "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',
      # Assigning whatever is in 1st or 2nd position to the LIKES
      "%#{names_array[0]}%", "%#{names_array[1]}%", "%#{names_array[0]}%", "%#{names_array[1]}%").order(:first_name)
    end
  end
  
  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end
  
  def current_friendship(friend)
    friendships.where(friend: friend).first
  end
  
  
  
end
