require_relative "process_matches"

def top_teams
  matches_file = ARGV[0]
  extension = File.extname(matches_file)
  raise ("Input must be a text file") if extension != ".txt"

  print_top_teams(matches_file)
end

top_teams
