class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.date :date
      t.integer :game_number
      t.string :home_team
      t.string :away_team
      t.integer :home_team_score
      t.integer :away_team_score
      t.string :mlb_id
      t.string :bbref_id
      t.string :wrap_text
      t.string :wrap_url
      t.string :recap_text
      t.string :recap_url
      t.string :youtube_id

      t.timestamps
    end

    add_index :games, :date
    add_index :games, :game_number
  end
end
