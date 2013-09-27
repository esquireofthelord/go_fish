class Player
  def initialize(name)
    @hand = []
    @set_count = 0
    @name = name
  end
  
  def put_cards_in_hand(card_or_cards)
    cards = Array(card_or_cards)
    @hand += cards
    color_received = cards.first.color
    matched_cards = find_all_cards_of_color(color_received)
    if matched_cards.length == 4
      remove_from_hand(matched_cards)
      @set_count += 1
    end
  end
  
  def give_cards!(color)
    matched_cards = find_all_cards_of_color(color)
    remove_from_hand(matched_cards)
    matched_cards
  end
  
  def empty_hand?
    @hand.empty?
  end
  
  def set_count
    @set_count
  end
  
  def hand
    @hand
  end
  
  def name
    @name
  end
  
  private  
  def find_all_cards_of_color(color)
    @hand.select do |card|
      card.color == color
    end
  end
  
  def remove_from_hand(cards)
    @hand -= cards
  end

end
