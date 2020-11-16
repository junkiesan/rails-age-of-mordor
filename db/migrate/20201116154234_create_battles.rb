class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.integer :player_1_id
      t.integer :player_2_id
      t.integer :winner_id
      t.integer :loser_id
      t.float :winner_score
      t.float :loser_score
      t.boolean :draw, default: false
      t.float :score1
      t.float :score2

      t.timestamps
    end
  end
end
