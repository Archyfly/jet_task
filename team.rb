class Team
  require './gamer.rb'
  attr_accessor :team_name, :team_number, :gamers

  def initialize(team_number, name)
    @team_number = team_number
    @team_name = name
    @gamers = []
  end

  def show_gamers
    @gamers
  end

  def add_gamers(gamer)
    @gamers << gamer
  end

end

