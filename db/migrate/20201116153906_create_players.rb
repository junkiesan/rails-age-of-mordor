class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :life_points, default: 5, null: false
      t.float :attack_points, default: 1.0, null: false
      t.integer :strength_points, default: 6, null: false
      t.integer :intelligence_points, default: 4, null: false
      t.integer :magic_points, default: 5, null: false
      t.string :avatar

      t.timestamps
    end
  end
end
