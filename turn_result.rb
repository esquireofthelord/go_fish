class TurnResult
  def initialize(recieved_requested_color, received_cards)
    @received_requested_color = recieved_requested_color
    @received_cards = received_cards
  end
  
  def received_requested_color?
    @received_requested_color
  end
  
  def received_cards
    @received_cards
  end
end