require "test_helper"
require "process_matches"

describe "print_top_teams" do
  before do
    @input = File.open("sample-input.txt", "r")
    @expected_output = File.open("expected-output.txt", "r").read.to_s + "\n"
  end

  describe "given a proper set of match results" do
    it "prints cumulative matchday score results" do
      assert_output(@expected_output) { print_top_teams(@input) }
    end
  end
end

describe "parse_match" do
  describe "given a valid match result" do
    valid_match = "San Jose Earthquakes 3, Santa Cruz Slugs 3"
    expected_sets = [["San Jose Earthquakes", 3], ["Santa Cruz Slugs", 3]]
    it "returns a pair of teams and their respective scores" do
      assert_equal(expected_sets, parse_match(valid_match))
    end
  end
end

describe "top_3_for_match_day" do
  describe "given a cumulative set of matchday rankings" do
    it "returns the top 3 teams in alphabetical order" do
      rankings = {
        "San Jose Earthquakes" => 4,
        "Aptos FC" => 4,
        "Capitola Seahorses" => 0,
        "Santa Cruz Slugs" => 6,
        "Monterey United" => 2,
        "Felton Lumberjacks" => 1
      }
      expected = "Santa Cruz Slugs, 6 pts\nAptos FC, 4 pts\nSan Jose Earthquakes, 4 pts"
      assert_equal(expected, top_3_for_match_day(rankings))
    end
    
    it "handles pluralization of points" do
      rankings = {
        "San Jose Earthquakes" => 1,
        "Aptos FC" => 1,
        "Capitola Seahorses" => 1,
        "Santa Cruz Slugs" => 6,
        "Monterey United" => 1,
        "Felton Lumberjacks" => 1
      }
      expected = "Santa Cruz Slugs, 6 pts\nAptos FC, 1 pt\nCapitola Seahorses, 1 pt"
      assert_equal(expected, top_3_for_match_day(rankings))
    end
  end
end
