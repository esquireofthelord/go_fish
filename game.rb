class Game
  INITIAL_DEAL = 5
  
  def initialize(player_count)
    @deck = Deck.new
    @deck.shuffle!
    @players = create_new_players(player_count)
    deal_cards_to_players
    @active_player = @players.first
  end
  
  def play_turn(target_player, color)
    matched_cards = target_player.give_cards!(color)
    if matched_cards.any?
      @active_player.put_cards_in_hand(matched_cards)
      TurnResult.new(true, matched_cards)
    else
      drawn_card = go_fish(target_player, color)
      TurnResult.new(false, drawn_card)
    end
  end
  
  def ended?
    @players.any?(&:empty_hand?) || @deck.empty?
  end
  
  def winner
    @players.max do |player1, player2|
      player1.set_count <=> player2.set_count
    end
  end

  def players
    @players
  end
  
  def active_player
    @active_player
  end
  
  private
  
  def go_fish(target_player, requested_color)
    drawn_card = @deck.deal!
    @active_player.put_cards_in_hand(drawn_card)
    if drawn_card.color != requested_color
      @active_player = target_player
    end
    [drawn_card]
  end
  
  def deal_cards_to_players
    INITIAL_DEAL.times do
      @players.each do |player|
        player.put_cards_in_hand(@deck.deal!)
      end
    end
  end
  
  def create_new_players(player_count)
    Array.new(player_count) do |n|
      name = "Player #{n + 1}"
      Player.new(name)
    end
  end
end