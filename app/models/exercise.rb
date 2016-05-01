class Exercise < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :duration_in_min, presence: true, numericality: { only_integer: true }
  validates :workout, presence: true
  validates :workout_date, presence: true
  
end
