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

def print_top_teams(matches)

end
