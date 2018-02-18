require 'csv'

namespace :data do

  desc "import games from 2015, 2016, 2017"
  task import_games: :environment do
    [[2015, 'games_2015.csv'], [2016, 'games_2016.csv'], [2017, 'games_2017.csv']].each do |year, csv_file|
      CSV.readlines("lib/tasks/data/#{csv_file}").each do |row|
        game_number = row[0].strip
        date = row[1]
        team1 = BBREF_MAP[row[3]] || row[3]
        team2 = BBREF_MAP[row[5]] || row[5]
        team1_away = row[4] == '@'
        team1_runs = row[7]
        team2_runs = row[8]
        doubleheader = date.include?('(1)') ? '1' : (date.include?('(2)') ? '2' : '0')
        
        next if game_number == 'Gm#'

        begin
          parsed_date = DateTime.parse(date).change(year: year).to_date.to_s
        rescue ArgumentError
          puts "ArgumentError: #{date}"
        end

        Game.create({
          game_number: game_number,
          date: parsed_date,
          home_team: team1_away ? team2 : team1,
          away_team: team1_away ? team1 : team2,
          home_team_score: team1_away ? team2_runs : team1_runs,
          away_team_score: team1_away ? team1_runs : team2_runs,
          bbref_id: "#{team1_away ? team2 : team1}#{parsed_date.gsub('-', '')}#{doubleheader}"
        })
      end
    end
    puts "Done."
  end

  BBREF_MAP = {
    'CHC' => 'CHN',
    'CHW' => 'CHA',
    'KCR' => 'KCA',
    'LAA' => 'ANA',
    'LAD' => 'LAN',
    'NYM' => 'NYN',
    'NYY' => 'NYA',
    'SDP' => 'SDN',
    'SFG' => 'SFN',
    'STL' => 'SLN',
    'TBR' => 'TBA',
    'WSN' => 'WAS'    
  }.freeze
end

