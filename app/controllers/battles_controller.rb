class BattlesController < ApplicationController
  before_action :set_battle, only: :show
  before_action :set_players, only: %i[new create]

  def index
    @battles = Battle.all
  end
  
  def show
    @player_1 = Player.find(@battle.player_1_id)
    @player_2 = Player.find(@battle.player_2_id)
    @score_1 = score(@player_1)
    @score_2 = score(@player_2)
    if(@score_1 == @score_2)
      @winner = nil
    else
      if @score_1 > @score_2
        @winner = @player_1
        @player_2.life_points -= 0.5
        @player_2.save
        @player_1.life_points += 0.5
        @player_1.attack_points += 0.8
        @player_1.save
      else
        @winner = @player_2
        @player_1.life_points -= 0.5
        @player_1.save
        @player_2.life_points += 0.5
        @player_2.attack_points += 0.8
        @player_2.save
      end
    end
  end

  def new
    @battle = Battle.new
    @players = Player.all
    @players_count = Player.count
  end

  def create
    @battle = Battle.create(battle_params)
    if @battle.save
      redirect_to battle_path(@battle)
    else
      render :new
    end
  end

  private

  def score(player)
    attack = player.attack_points
    strength = player.strength_points
    intelligence = player.intelligence_points
    magic = player.magic_points
    attack + strength * 0.8 + intelligence * 0.7 + magic * 0.9
  end

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def set_players
    @players = Player.where('life_points > ?', 0.0)
  end

  def battle_params
    params.require(:battle).permit(:player_1_id, :player_2_id)
  end
end
