require 'test/unit'
require_relative './connectfour'

class TestGame < Test::Unit::TestCase
  def test_game
    game = Game.new()
    movement = game.make_move 10
    assert_equal(false, false, movement)
    place_piece_for_valid_move = game.make_move 3
    assert_equal("R", "R",  place_piece_for_valid_move)
    valid_move = game.is_valid_move 
    assert_equal(false, false,  valid_move)
    change_player = game.switch_player 
    assert_equal("B", "B", change_player)
    place_piece_for_valid_move = game.make_move 2
    assert_equal("B", "B",  place_piece_for_valid_move)
    win = game.check_for_win
    assert_equal(false, false,  win)
  end

  def test_game2
    game = Game.new()
    movement = game.make_move -1
    assert_equal(false, false, movement)
    check_for_win = game.check_for_win
    assert_equal(false, false, check_for_win)
    movement = game.make_move 4
    assert_equal("R","R", movement)
    change_player = game.switch_player 
    assert_equal("B", "B", change_player)
    movement = game.make_move 2
    assert_equal("B", "B",  movement)
    win = game.check_for_win
    assert_equal(false, false,  win)
  end

  def test_game3
    game = Game.new()
    movement = game.make_move 5
    assert_equal("R", "R",  movement)
    change_player = game.switch_player 
    assert_equal("B", "B",  change_player)
    movement = game.make_move 2
    assert_equal("B", "B",  movement)
    change_player = game.switch_player 
    assert_equal("R", "R", change_player)
    movement = game.make_move 6
    assert_equal("R", "R", movement)
  end

  def test_occupied
    # If space == " " return false.
    # If space == 'R' || 'B' return true.
  end

  def test_win
    # Every possible way to win in this game is available.
    # If pattern is found => return true.
    # If check_for_win == true, then show the player who won.
    # If no pattern is found => return false, and continue playing.
  end

  def test_tie_game
    # If no pattern is found, and board is filled, then end the game and report tie game.
  end

  def test_image
    # If 'R' == green piece image
    # If 'B' == black piece image
    #
  end
  
  def test_button_down
    # left mouse click? => return true.
    # right mouse? != valid => return false.
    # Any other button pressed, that is not spacebar or escape => return false.
  end

  def test_reset
    # When the game ends, press either spacebar or escape.
    # If spacebar is pressed => reset.
    # If escape is pressed => close game window.
  end
  
  def test_end_game
    # If end_game == true, then either reset or close the game.
  end
end
