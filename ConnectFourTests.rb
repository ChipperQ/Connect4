require 'test/unit'
require_relative './connectfour'

class TestGame < Test::Unit::TestCase
  def test_game
    game = Game.new()
    movement = game.make_move 10
    assert_equal movement, false
    place_piece_for_valid_move = game.make_move 3
    assert_equal place_piece_for_valid_move, "R"
    valid_move = game.is_valid_move 
    assert_equal valid_move, false
    change_player = game.switch_player 
    assert_equal change_player, "B"
    place_piece_for_valid_move = game.make_move 2
    assert_equal place_piece_for_valid_move, "B"
    win = game.check_for_win
    assert_equal win, false
  end
  def test_game2
    game = Game.new()
    movement = game.make_move -1
    assert_equal movement, false
    check_for_win = game.check_for_win
    assert_equal check_for_win, false
    movment = game.occupied?
    assert_equal movement, false
    movement = game.make_move 4
    assert_equal movement, "R"
    change_player = game.switch_player 
    assert_equal change_player, "B"
    movement = game.make_move 2
    assert_equal movement, "B"
    win = game.check_for_win
    assert_equal win, false
  end
  def test_game3
    game = Game.new()
    movement = game.make_move 5
    assert_equal movement, "R"
    change_player = game.switch_player 
    assert_equal change_player, "B"
    movement = game.make_move 2
    assert_equal movement, "B"
    change_player = game.switch_player 
    assert_equal change_player, "R"
    movement = game.make_move 6
    assert_equal movement, "R"
  end
  # The game ends when someone wins, or if the board is all filled with no patterns.
  # Every possible way to win this is available. So that works.
end

class GameWindow
  # When player switches, so does the image of the piece.
  # When the game ends it displays who won, or a 'tie' image if no one won.
  # When the left mouse click is clicked, and it is a valid move, an image is placed on the board.
  # Escape and space button do their job correctly. The escape button leaves the game, and the space button resets the game.
  
end