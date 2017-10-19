class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?

  attr_accessor :name
  def initialize(name="")
  	@name = name
  	@state = "inconnus"
    #TO DO : doit régler son nom, sa valeur, son état de victoire
  end

  def victoire
  	@state = "victoire"

  end
end
