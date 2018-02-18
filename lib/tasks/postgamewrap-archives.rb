require 'httparty'

url = 'https://www.reddit.com/user/sfgpostgamewrap.json'
user_agent = "SFG Post-Game Wrap Bot v1.0.0 (by /u/SFGPostGameWrap)"
after = ''

loop do
  response = HTTParty.get(url + "?after=#{after}", headers: {'User-Agent' => user_agent}).parsed_response

  p response['error'] if response['error']
  data = response['data']
  after = data['after']
  break if after.nil? || after == ''
  comments = data['children']
  comments.each do |comment|
    created_at = Time.at(comment['data']['created_utc']).to_date

    body = comment['data']['body']
    matches = body.split("\n").map {|s| s.match('KNBR: \[(.*)\]\((.*)\)') }.compact

    links = matches.map {|m| "\"#{m[1].gsub('"', "'")}\",#{m[2]}"}.join(',')
    puts "#{created_at},#{links}"
  end

  sleep 1
end
