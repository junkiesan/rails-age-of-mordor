class Player < ApplicationRecord
  has_many :primary_battles, class_name: 'Battle', foreign_key: 'player_1_id'
  has_many :secondary_battles, class_name: 'Battle', foreign_key: 'player_2_id'
  mount_uploader :avatar, AvatarUploader
  validates :name, uniqueness: true, presence: true
  # validates :avatar, presence: true
  validates :strength_points, presence: true
  validates :intelligence_points, presence: true
  validates :magic_points, presence: true
  validates :strength_points, inclusion: 0..10
  validates :intelligence_points, inclusion: 0..10
  validates :magic_points, inclusion: 0..10
  validate :max_10_points

  def max_10_points
    if strength_points + strength_points + intelligence_points + magic_points > 10
      errors.add(:strength_points, 'The total of all the points - strength, intelligence and magic - should not exceed 10.')
    end
  end
end
