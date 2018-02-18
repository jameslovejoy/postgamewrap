class Game < ApplicationRecord
  validates :date, :game_number, :home_team, :away_team, presence: true
end
