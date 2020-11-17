class Battle < ApplicationRecord
  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
  belongs_to :winner, class_name: 'Player', optional: true
  belongs_to :loser, class_name: 'Player', optional: true

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true
  validate :two_different_players

  def winner_or_loser(score1, score2)
    {
      winner: score1 > score2 ? player_1 : player_2,
      loser: score1 > score2 ? player_2 : player_1,
      winner_score: score1 > score2 ? score1 : score2,
      loser_score: score1 > score2 ? score2 : score1
    }
  end

  def battle_winner
    winner_or_loser(score1, score2)[:winner]
  end

  def battle_loser
    winner_or_loser(score1, score2)[:loser]
  end

  def battle_winner_score
    winner_or_loser(score1, score2)[:winner_score]
  end

  def battle_loser_score
    winner_or_loser(score1, score2)[:loser_score]
  end

  def self.update_battle_scores(battle)
    battle.score1 = battle.player_1.score
    battle.score2 = battle.player_2.score
    battle.save
  end

  def self.update_battle_winner_loser(battle)
    battle.winner = battle.battle_winner
    battle.loser = battle.battle_loser
    battle.winner_score = battle.battle_winner_score
    battle.loser_score = battle.battle_loser_score
    battle.save
  end

  def two_different_players
    message = 'The two players must be different!'
    errors.add(:player_2_id, message) if player_2_id == player_1_id
  end
end

