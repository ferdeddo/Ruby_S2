require_relative "BoardCase"


class Board
  include Enumerable
  attr_accessor :cases
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases


  def initialize
  	@cases = [0, BoardCase.new(1," "), BoardCase.new(2," "), BoardCase.new(3," "), BoardCase.new(4," "), BoardCase.new(5," "), BoardCase.new(6," "), BoardCase.new(7," "), BoardCase.new(8," "), BoardCase.new(9," ")]

    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
  end

  def to_s
  #TO DO : afficher le plateau
   puts "  Board state       Positions"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[1].state.to_s + " | " + @cases[2].state.to_s + " | " + @cases[3].state.to_s + " |    | 1 | 2 | 3 |"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[4].state.to_s + " | " + @cases[5].state.to_s + " | " + @cases[6].state.to_s + " |    | 4 | 5 | 6 |"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[7].state.to_s + " | " + @cases[8].state.to_s + " | " + @cases[9].state.to_s + " |    | 7 | 8 | 9 |"
    	puts "  ---+---+---      ---+---+---      "
        puts
    end

   

  def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
        @cases[1].state = " "
        @cases[2].state = " "
        @cases[3].state = " "
        @cases[4].state = " "
        @cases[5].state = " "
        @cases[6].state = " "
        @cases[7].state = " "
        @cases[8].state = " "
        @cases[9].state = " "    
  end

  def victory?
  	@cases.each do |c|

            if c != 0 && c.state == " "
                return false
            end
        end
        return true
    end

end
    #TO DO : qui gagne ?
  
