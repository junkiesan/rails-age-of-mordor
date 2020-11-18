class Player < ApplicationRecord
  has_many :primary_battles, class_name: 'Battle', foreign_key: 'player_1_id'
  has_many :secondary_battles, class_name: 'Battle', foreign_key: 'player_2_id'
  has_many :won_battles, class_name: 'Battle', foreign_key: 'winner_id'
  has_many :lost_battles, class_name: 'Battle', foreign_key: 'loser_id'
  has_one_attached :avatar

  mount_uploader :avatar, AvatarUploader
  validates :name, uniqueness: true, presence: true
  validates :strength_points, presence: true
  validates :intelligence_points, presence: true
  validates :magic_points, presence: true
  validates :strength_points, inclusion: 0..10
  validates :intelligence_points, inclusion: 0..10
  validates :magic_points, inclusion: 0..10
  validates :avatar, allow_blank: true, format: {
    with: %r{\.gif|jpg|png}i, # rubocop:disable Style/RegexpLiteral
    message: 'must be a gif, jpg, or png image.'
  }
  validate :max_20_points

  def max_20_points
    total_skills = strength_points + intelligence_points + magic_points
    errors.add(:strength_points, 'Skill points > 20') if total_skills > 20
  end

  def score
    skills = [strength_points, intelligence_points, magic_points].shuffle!
    attack_points + skills[0] * 0.5 + skills[1] * 0.7 + skills[2] * 0.9
  end

  def victory_ratio
    won_battles.count.to_f / (primary_battles + secondary_battles).count.to_f
  end
end
