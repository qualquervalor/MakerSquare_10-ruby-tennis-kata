  # Public: This is a code kata respresenting scoring of a Tennis game.
  # it model two player and the ability for each to score points
  class Game
    # Public: Gets/Sets the player in the game.
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      winner.record_won_ball!
    end
  end

  # Public: This is a Player in a modeled Tennis game.  THe player has the ability
  # to record points and return his score.
  class Player
    # Public: Gets/Sets a player point data.
    attr_accessor :points

    # Public: Gets/Sets the player's oppent
    attr_accessor :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      if @points == 3  && @opponent.points < 3
        return 'forty' 
      elsif @points >= 3 && @opponent.points == @points
        return 'deuce'
      elsif @points >= 3 && @opponent.points == @points - 1
        return 'advantage'
      elsif @points >= 3 && @opponent.points <= @points -2
        return 'win'
      else
        return 'unexpected situtation call for a judgement'
      end   
    end
  end
end