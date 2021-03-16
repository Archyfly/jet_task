class Game
  require 'date'
  attr_accessor :date, :team2, :team1

  def initialize(team1, team2, date)
    @team1 = team1
    @team2 = team2
    @date = Date.parse(date).iso8601
  end

end
