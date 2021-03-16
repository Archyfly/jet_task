class Gamer
  attr_accessor :number, :full_name, :age, :gamer_achieves, :achieves, :team_number

  def initialize(number, name, age)
    @team_number = nil
    @number = number
    @full_name = name
    @age = age
    @achieves_in_games = {}
  end

  def add_achieve(game_id, achieves_id)
    @achieves_in_games[game_id] = achieves_id
  end

  def count_achieves_in_game(game_id)
    @achieves_in_games[game_id].count
  end

  def has_achieve(achieve_id)
    @achieves_in_games.each do |game, achieves|
      game.each do |achieve|
        achieve.each do |ach|
          result = 1 if achieve_id == ach
        end
      end
    end
  end

end
