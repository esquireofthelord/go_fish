class Deck
  COLORS = ["red", "blue", "green", "purple", "yellow", "magenta", "orange", "emrald", "black", "white", "brown", "grey", "pink"]
  
  def initialize
    @cards = []
    COLORS.each do |color|
      4.times do
        @cards << Card.new(color)
      end
    end
  end
  
  def shuffle!
    @cards.shuffle!
  end
  
  def deal!
    @cards.shift
  end
  
  def empty?
    @cards.empty?
  end
end
