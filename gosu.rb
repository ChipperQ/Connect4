require 'gosu'
require './connectfour'

# Calls the game class, and runs the game with images.
# '541,465' creates a window that is the exact size of the board.
class GameWindow < Gosu::Window
  	def initialize
  		super 541, 465, false
  		self.caption = "Connect 4"
  		@game = Game.new()
  		@background_image = Gosu::Image.new(self, "c4board.png", true)
      @black_piece = Gosu::Image.new(self, "b.png", true)
      @green_piece = Gosu::Image.new(self, 'g.png', true)
      @green_winning_piece = Gosu::Image.new(self, 'winner_green.png', true)
      @black_winning_piece = Gosu::Image.new(self, 'winner_black.png', true)
      @no_winner = Gosu::Image.new(self, 'no_winner.png', true)
  	end

# Allows the user to use the mouse.
  	def needs_cursor?
  		true
    end

# Creates an index from the mouse location.
# 'left_x_for_pixel' and 'right_x_for_pixel', user can only click from the 7 columns, 0..7, non-inclusive. 
   def index_from_mouse_location()
      left_x_for_pixel = 1
      right_x_for_pixel = 77
      column = 7
      @column_index = ((mouse_x.to_i-left_x_for_pixel)/right_x_for_pixel)
      @row_index = (column*(((mouse_y.to_i)-left_x_for_pixel)/right_x_for_pixel))
      @index = @column_index + @row_index
    end

# Creates a location from the given index.
# The 7 in @column and @row is for the number of columns of the board.
# The 77 and 5 is to place the image in the center of each circle.    
    def location_from_index(index)
      @column = (index%7)
      @row = (index/7)
      return [(@column*77)+5, (@row*77)+5]
    end

# Resets the game.     
  	def reset_if_replay()
  		@game = Game.new()
  	end     

# Allows the user to press the escape and space button, and left mouse clicks.
    def button_down(id)
    	close if id == Gosu::KbEscape
      reset_if_replay() if id == Gosu::KbSpace
      if id == Gosu::MsLeft
        if @game.end_game() || @game.game_tie?()
         nil
        else
          location_from_index(index_from_mouse_location())
          if @game.make_move(@column)
            @game.end_game()
            @game.switch_player() unless @game.end_game()
          end
        end
      else
        puts "Only left clicks." unless id == Gosu::KbEscape || id == Gosu::KbSpace
      end
    end    

# '0,0,0' Places the board image at the canter of the window.
# '170,45,0' Places the win images, and tie image under the first row in the center.
    def draw()
      @background_image.draw(0, 0, 0)
      for index in 0..41
        if @game.board[index] == "R"
          (x,y) = location_from_index(index)
          @green_piece.draw(x,y,0)
        elsif @game.board[index] == "B"
          (x,y) = location_from_index(index)
          @black_piece.draw(x,y,0)
        end
      end
      
      if @game.game_tie?()
        @no_winner.draw(170,45,0)
      end
      
      if @game.end_game()
        if @game.current_player == 'R'
          @green_winning_piece.draw(170,45,0)
        elsif @game.current_player == 'B'
          @black_winning_piece.draw(170,45,0)
        end 
      end
    end
    
  end
  
  window = GameWindow.new
  window.show
