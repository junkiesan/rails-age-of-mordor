class Battle < ApplicationRecord
  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
  validates :player_1_id, presence: true
  validates :player_2_id, presence: true
end
