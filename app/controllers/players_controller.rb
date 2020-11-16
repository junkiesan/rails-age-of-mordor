class PlayersController < ApplicationController

  def index
    @players = Player.all
    @players_count = Player.count
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(players_params)
    if @player.save
      redirect_to new_battle_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def players_params
    params.require(:player).permit(:name,
                                   :life_points,
                                   :attack_points,
                                   :strength_points,
                                   :intelligence_points,
                                   :magic_points,
                                   :avatar)
  end
end
