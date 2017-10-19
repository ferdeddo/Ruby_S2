require_relative "Player"
require_relative "Board"
require_relative "BoardCase"


class Game

  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "what's your name player 1 ?"
        name_player1 = gets.chomp
        @player1 = Player.new("#{name_player1}")
        puts "what's your name player 2 ?"
        name_player2 = gets.chomp
        @player2 = Player.new("#{name_player2}")
        puts "Here we go! " 
        @board= Board.new
        self.menu
  end


def menu
        rep = nil
        while rep != "q"
            puts "Play or Quit ? p/q"
            rep = gets.chomp
            self.go if rep == "p"
        end
end
  def go
    # TO DO : lance la partie
     @board.play
        winner = nil
        @board.to_s
        until winner != nil || @board.victory? == true do

            choice = ""
            choice_is_valid = false

            until choice_is_valid do
                puts "#{@player1.name} turn : your choice ?"
                choice = gets.chomp
                if @board.cases[choice.to_i].to_s
                    @board.cases[choice.to_i].state = "X"
                    choice_is_valid = true
                else
                    puts "Cette touche n'existe pas bro (-_-), essaie encore."
                end
            end

            @board.to_s

            winner = self.turn

            if winner == nil && !@board.victory?
                choice_is_valid = false
                until choice_is_valid do
                    puts "#{@player2.name} turn : your choice ?"
                    choice = gets.chomp
                    if @board.cases[choice.to_i].to_s
                        @board.cases[choice.to_i].state ="O"
                        choice_is_valid= true
                    else
                        puts "Cette touche n'existe pas numéro 2 (-_-), essaie encore."
                    end
                end
                @board.to_s
            end

        end
        puts "game finished"
        if winner != nil
            puts "Bravo " + winner.name 
        elsif @board.victory?
            puts "Vous êtes serieux là ?"
        end


  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
   [1,4,7].each { |n|
            if @board.cases[n].state == "X" && @board.cases[n + 1].state == "X" && @board.cases[n + 2].state == "X"
                return @player1
            elsif @board.cases[n].state == "O" && @board.cases[n + 1].state == "O" && @board.cases[n + 2].state == "O"
                return @player2
            end
        }
        [1,2,3].each { |n|
            if @board.cases[n].state == "X" && @board.cases[n + 3].state == "X" && @board.cases[n + 6].state == "X"
                return @player1
            elsif @board.cases[n].state == "O" && @board.cases[n + 3].state == "O" && @board.cases[n + 6].state == "O"
                return @player2
            end
        }

            if @board.cases[1].state == "X" && @board.cases[5].state == "X" && @board.cases[9].state == "X"
                return @player1
            elsif @board.cases[1].state == "O" && @board.cases[5].state == "O" && @board.cases[9].state == "O"
                return @player2
            end
            if @board.cases[3].state == "X" && @board.cases[5].state == "X" && @board.cases[7].state == "X"
                return @player1
            elsif @board.cases[3].state == "O" && @board.cases[5].state == "O" && @board.cases[7].state == "O"
                return @player2
            end

        return nil
    end

  end



Game.new.go