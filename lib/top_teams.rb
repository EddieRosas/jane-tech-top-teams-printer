require_relative "process_matches"

def top_teams
  matches_file = ARGV[0]
  print_top_teams(matches_file)
end

top_teams
