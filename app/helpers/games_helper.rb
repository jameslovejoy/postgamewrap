module GamesHelper
  CODE_TO_NAME_MAP = {
    "ANA" => 'Los Angeles Angels',
    'ARI' => 'Arizona Diamondbacks',
    'ATL' => 'Atlanta Braves',
    'BAL' => 'Baltimore Orioles',
    'BOS' => 'Boston Red Sox',
    "CHA" => 'Chicago White Sox',
    "CHN" => 'Chicago Cubs',
    'CIN' => 'Cincinnati Reds',
    'COL' => 'Colorado Rockies',
    'CLE' => 'Cleveland Indians',
    'DET' => 'Detroit Tigers',
    'HOU' => 'Houston Astros',
    "KCA" => 'Kansas City Royals',
    "LAN" => 'Los Angeles Dodgers',
    'MIA' => 'Miami Marlins',
    'MIL' => 'Milwaukee Brewers',
    'MIN' => 'Minnesota Twins',
    "NYA" => 'New York Yankees',
    "NYN" => 'New York Mets',
    'OAK' => 'Oakland Athletics',
    'PHI' => 'Philadelphia Phillies',
    'PIT' => 'Pittsburgh Pirates',
    "SDN" => 'San Diego Padres',
    'SEA' => 'Seattle Mariners',
    "SFN" => 'San Francisco Giants',
    "SLN" => 'St. Louis Cardinals',
    'TOR' => 'Toronto Blue Jays',
    "TBA" => 'Tampa Bay Rays',
    'TEX' => 'Texas Rangers',
    "WAS" => 'Washington Nationals'
  }.freeze

  def game_score(game)
    url = "https://www.baseball-reference.com/boxes/#{game.home_team}/#{game.bbref_id}.shtml"
    text = "#{game.away_team} #{game.away_team_score} @ #{game.home_team} #{game.home_team_score}"
    link_to_if game.bbref_id.present?, text, url, target: '_blank'
    # raw "#{CODE_TO_NAME_MAP[game.away_team]} #{game.away_team_score}<br/>@<br/>#{CODE_TO_NAME_MAP[game.home_team]} #{game.home_team_score}"
  end

  def link_to_mlbcom(game)
    if game.mlb_id.present?
      url = "https://www.mlb.com/gameday/#{game.mlb_id}"
      link_to "Gameday", url, target: '_blank'
    end
  end

  def link_to_bbref(game)
    if game.bbref_id.present?
      url = "https://www.baseball-reference.com/boxes/#{game.home_team}/#{game.bbref_id}.shtml"
      link_to 'Boxscore', url, target: '_blank'
    end
  end

  def link_to_baseball_theater(game)
    if game.mlb_id.present?
      url = "https://baseball.theater/game/#{game.date.strftime('%Y%m%d')}/#{game.mlb_id}"
      link_to 'Highlights', url, target: '_blank'
    end
  end

  def link_to_youtube(game)
    if game.youtube_id.present?
      url = "https://www.youtube.com/watch?v=#{game.youtube_id}"
      link_to "Full Game", url, target: '_blank'
    end
  end
end
