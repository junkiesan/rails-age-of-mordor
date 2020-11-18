class AfterBattleService
  def update(battle)
    battle.update_battle_scores
    if battle.score1 == battle.score2
      battle.draw = true
      battle.save
    else
      battle.update_battle_winner_loser
      battle.adjust_life_attack
    end
  end
end
