class WheelOfFortune

attr_reader :theme, :phrase, :guesses

  def initialize (game)
    @theme = game[:theme]
    @phrase = game[:phrase]
    @game = Hash.new({theme: theme, phrase: phrase})
    @guesses = []
  end

  def to_s
 @phrase.split('').map! do |char|
 	@guesses.include?(char.downcase) || char == ' ' ? char : char = "_"
 end.join('')
end

  def guesses
@guesses
  end

  def theme
    @theme
  end


  def can_i_have?(input)
    input = input.downcase
    @guesses << input
    @phrase.downcase.split('').include?(input.downcase)
  end

  def game_over?
  if   to_s.include?("_")
     return false
  else
    true
  end
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
