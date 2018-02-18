require 'csv'

namespace :data do

  desc "import wrap MP3 URLs from 2015, 2016, 2017"
  task import_mp3_urls: :environment do
    CSV.readlines("lib/tasks/data/knbr.csv").each do |row|
      game_date, wrap_text, wrap_url, recap_text, recap_url = row

      if game = Game.where('date = ?', game_date).first
        game.update_attributes(
          wrap_text: wrap_text,
          wrap_url: wrap_url,
          recap_text: recap_text,
          recap_url: recap_url
        )
      end
    end
    puts "Done."
  end
end