class Board
  ALL_COLORS = "rrrrggggyyyybbbb".chars

  def generate_colors
    ALL_COLORS.shuffle[0..3]
  end

end

# This allows repeats in colors and will shuffle the board and put into an array for comparison
