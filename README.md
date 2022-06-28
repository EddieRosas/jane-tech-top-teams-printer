# Soccer League Results Printer
Challenge presented by Jane Technologies and accepted by Eddie Rosas.

## How to run the program
Ensure `Ruby 3.0.3` is installed.

The program will expect a text file with properly formatted match results
(see the sample-input.txt file) as it's argument.

To execute the script with the sample input file:
After cloning the project and changing into its root directory,
run:

```sh
  $ ruby lib/top_teams.rb sample-input.txt
```

## Running Tests
The tests can be run with `minitest` and `rake`--you'll need to ensure
`bundler` is installed. The `bundler` version I used for this
application is `2.2.33`.

To install `bundler`, run 
```sh
  $ gem install bundler
```
Then after making sure you're in the root directory of the project,
run 
```sh
  $ bundle install
```

Running the tests:
```sh
  $ rake test
```
## Design and Implementation Thoughts

I wanted to make sure I would adhere to the verbal guidelines I received regarding
staying within the two to three hour limit and simply address the problem as
well as I could.

I constantly kept the written constraints in mind to help me stay on task,
especially:
  - "The number of teams participating in a league is unknown and should be determined
    by the software"
    - I immediately assumed to keep scalability in mind. If there were hundreds or thousands
      of teams, we would want to make sure that our program could scale for it. That's why
      I felt that reading the file a line at a time would be best since it could at least try to
      keep the memory at one time a bit lower. I paid attention to how many data structures I'd have to
      create hence leveraging hashes for constant time look-ups (assuming no collision) when checking
      if a team was taken into account during a matchday since no delimiters were used to differentiate
      matchdays in the input.
  - "The input and output will be text. A static file will be used to represent the game results"
    - This let me not worry too much about edge cases regarding invalid formats as
      input; but if given more time, I would have made more checks and written more
      tests to have reflected those extra considerations.

As far as testing goes, I chose to use `Minitest::Spec` specifically to take advantage of the spec-like
presentation of the DSL. I sought to make better use of my time putting together this program by making
sure my tests reminded me what exactly it was trying tosolve. The english-like syntax, I feel, is great
for communicating what the big picture goal of an application is.
