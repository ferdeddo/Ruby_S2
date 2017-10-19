class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

  attr_accessor :state
  attr_reader :number
  def initialize(number, state)
  	@number = number
  	@state = state 
    #TO DO doit régler sa valeur, ainsi que son numéro de case
  end
  
  def to_s
    #TO DO : doit renvoyer la valeur au format string
    return @state == " "
  end

end

