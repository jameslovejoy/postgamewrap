#  To download the game IDs:
#
#  resp = HTTParty.get('https://statsapi.mlb.com/api/v1/schedule?lang=en&sportId=1&season=2015&startDate=2015-04-06&endDate=2015-10-04&teamId=137')
#  mlb_ids = resp.parsed_response['dates'].map {|d| d['games']}.flatten.map {|g| g['gamePk']}
#  index = 162; ids.uniq.reverse.each {|id| puts "2015,#{index},#{id}"; index -= 1}
#
require 'csv'

namespace :data do

  desc "import MLB game IDs from 2015, 2016, 2017"
  task import_mlb_ids: :environment do
    CSV.readlines("lib/tasks/data/mlb_ids.csv").each do |row|
      year, game_number, mlb_id, youtube_id = row
      if game = Game.where(game_number: game_number.to_s).where('EXTRACT(YEAR FROM "date") = ?', year).first
        game.update_attribute(:mlb_id, mlb_id)
        game.update_attribute(:youtube_id, youtube_id) if youtube_id.present?
      end
    end
    puts "Done."
  end

end