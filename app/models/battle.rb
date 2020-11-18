class Battle < ApplicationRecord
  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :loser, class_name: 'Player', optional: true

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true
  validate :two_different_players

  def update_battle_scores
    self.score1 = player_1.score
    self.score2 = player_2.score
    save
  end

  def update_battle_winner_loser
    self.winner = winner_loser[:winner]
    self.loser = winner_loser[:loser]
    self.winner_score = winner_loser_score[:winner_score]
    self.loser_score = winner_loser_score[:loser_score]
    save
  end

  def adjust_life_attack
    winner.attack_points += 0.3
    loser.life_points -= 1
    winner.save
    loser.save
  end

  def two_different_players
    message = 'The two players must be different!'
    errors.add(:player_2_id, message) if player_2_id == player_1_id
  end

  private 

  def winner_loser
    {
      winner: score1 > score2 ? player_1 : player_2,
      loser: score1 > score2 ? player_2 : player_1
    }
  end

  def winner_loser_score
    {
      winner_score: score1 > score2 ? score1 : score2,
      loser_score: score1 > score2 ? score2 : score1
    }
  end
end

