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
