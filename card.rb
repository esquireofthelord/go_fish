class Card
  def initialize(color)
    @color = color
  end
  
  def color
    @color
  end
  
  def ==(other_card)
    @color == other_card.color
  end
end