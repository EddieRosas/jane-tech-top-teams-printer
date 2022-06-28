def parse_match(match)
  team1, team2 = match.split(",")

  score_pattern = /\s+\d+$/
  team1_name = team1.sub(score_pattern, "").strip
  team1_score = team1.scan(score_pattern)[0].strip.to_i

  team2_name = team2.sub(score_pattern, "").strip
  team2_score = team2.scan(score_pattern)[0].strip.to_i
  
  [[team1_name, team1_score], [team2_name, team2_score]]
end

def top_3_for_match_day(rankings)
  rankings.sort_by { |t, p| [-p, t] }
          .first(3)
          .map do |team, league_points|
            points = league_points == 1 ? "pt" : "pts"
            "#{team}, #{league_points} #{points}"
          end.join("\n")
end

def print_top_teams(match_results)
  teams = Hash.new
  rankings = Hash.new(0)
  matchday = 0

  File.foreach(match_results) do |match|
    parsed_match = parse_match(match)

    team1, team2 = parsed_match
    team1_name, team1_score = team1
    team2_name, team2_score = team2

    # A matchday has ended when we begin to see teams from our team hash
    if teams[team1_name] || teams[team2_name]
      teams.each do |team, league_points|
        rankings[team] += league_points
      end

      matchday += 1
      puts "Matchday #{matchday}"
      puts top_3_for_match_day(rankings)
      puts ("\n")

      # reset the team hash for the new matchday
      teams = Hash.new
    end

    # League point accumulation
    if team1_score > team2_score
      teams[team1_name] = 3
      teams[team2_name] = 0
    elsif team2_score > team1_score
      teams[team2_name] = 3
      teams[team1_name] = 0
    else
      teams[team1_name] = 1
      teams[team2_name] = 1
    end
  end

  # Last matchday processing
  teams.each do |team, league_points|
    rankings[team] += league_points
  end

  matchday += 1
  puts "Matchday #{matchday}"
  puts top_3_for_match_day(rankings)
  puts ("\n")
end
