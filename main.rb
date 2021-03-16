require_relative './team.rb'
require_relative './achieve.rb'
require_relative './gamer.rb'
require_relative './game.rb'

class MainMenu

  TEAMS = %w(Orlando Mexico San-Trope Stars SafaryTeam Bronks Hawks)
  # In each team 3 gamers for example
  GAMERS_FN = %w(Sanny Holly Kris Mike Oliver Jack John)
  GAMERS_LN = %w(Orts Kleopatr Green)
  ACHIEVES = ["70km per game", "100 jumps", "60 downs", "5 leaves from field"]

  attr_accessor :teams, :gamers, :achieves, :matches

  def initialize
    @teams = []
    @gamers = []
    @games = []
    @achieves = []
  end

  # Block test data add
  def auto_data
    # Add test teams
    TEAMS.each_with_index { |team, index| @teams << Team.new(index+1, "#{team}") }
    gamers_count = 1

    # Create gamers
    GAMERS_FN.each_with_index do |gamer_fn, index_one|
      GAMERS_LN.each_with_index do |gamer_ln, index_two|
        @gamers << Gamer.new(gamers_count, "#{gamer_fn}"+" "+"#{gamer_ln}", 20+index_one-rand(5))
        gamers_count += 1
      end
    end
    # Add gamers to teams (for example 3 gamers in team)
    count = 1
    count_gamers_in_teams = @teams.count*3
    for i in (1..count_gamers_in_teams) do
      @teams.each do |team|
        if team.gamers.count < 3
          team.gamers << find_gamer(i)
          count += 1
        end
        i += 3
      end
    end

    # Create achieves
    ACHIEVES.each_with_index { |achieve, index| @achieves << Achieve.new(index+1, achieve) }

  end
  # Block test data add end

  # Block find begin
  def choice_gamer
    view_gamers
    puts "Select number of gamer from list above"
    number = gets.chomp.to_i
    gamer = find_gamer(number)
    puts "Gamer number: #{gamer.number} | full name: #{gamer.full_name} | age: #{gamer.age}"
  end

  def choice_team
    view_teams
    puts "Select number of team from list above"
    number = gets.chomp.to_i
    team = find_team(number)
    puts "Team number: #{team.team_number} | Team name: #{team.team_name} | "
    team.gamers.each do |gamer|
      puts "Gamer number #{gamer.number} | Gamer name: #{gamer.full_name} | Gamer age: #{gamer.age} | Gamer achieves: #{gamer.achieves}"
    end

    # test only
  end

  def find_gamer(number)
    gamer = @gamers.find { |gamer| gamer.number == number }
    return gamer
  end

  def find_team(number)
    team = @teams.find { |team| team.team_number == number }
    return team
  end

  # Block find end

  # Block view begin
  def view_achieves
    @achieves.each { |achieve| print("#{achieve.number} | #{achieve.desc} \n") }
  end

  def view_teams
    @teams.each { |team| puts "Team number: #{team.team_number} | Team name: #{team.team_name} | " }
  end

  def view_gamers
    @gamers.each { |gamer| puts "Gamer number: #{gamer.number} | full name: #{gamer.full_name} | age: #{gamer.age}" }
  end

  def view_games #TODO
    @games.each { |game|  puts game}
  end
  # Block view end


  def add_new_team
    puts 'Enter number of new team: '
    new_team_number = gets.chomp.to_i
    puts 'Enter name of new team: '
    new_team_name = gets.chomp
    @teams << Team.new(new_team_number, new_team_name)
  end

def list
  puts '===================Teams statistic info================='
  puts '------Enter your choice from MENU: --------'
  puts '1 - add team'
  puts '2 - add gamer'
  puts '3 - add match'
  puts '4 - view achieves for gamers'
  puts '5 - add new achieve'
  puts '6 - add achieve to gamer' #TODO

  puts '11 - Add test data achieves'
  puts '12 - Add test data teams'
  puts '13 - Add auto data' #+
  puts '14 - View teams' #+
  puts '17 - View team'
  puts '15 - View gamers' #+
  puts '16 - view gamer stats'
  puts '0 - EXIT' #+
  puts '=========================================================='
end

def user(choice)
  case choice
  when '1' then add_new_team
  when '4' then view_achieves
  # when '5' then add_new_achieve
  # when '11' then test_data_achieves
  # when '12' then test_data_teams
  when '13' then auto_data
  when '14' then view_teams
  when '15' then view_gamers
  when '16' then choice_gamer
  when '17' then choice_team
  end
end

def view_menu
  loop do
    list
    choice = gets.chomp
    break if choice.nil?

    user(choice)
  end
end
end

menu = MainMenu.new
menu.view_menu