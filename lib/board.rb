class Board < Hash

  attr_accessor :whites_turn

  def initialize
    super
    @whites_turn = true
    generate
  end

  def generate
    # The hash is populated in this precise order so that the display_board
    # method first scans the entire file 8, then 7 and so on.
    8.downto(1) do |rank|
      ('a'..'h').each do |file|
        square = :"#{file}#{rank}"
        self[square] = ' '
      end
    end
  end

  def populate
    # Pieces are placed on the board one file at a time.
    # This is the production version of the board.
    pieces_order = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    8.times do |file|
      eight = :"#{(97 + file).chr}8"
      seven = :"#{(97 + file).chr}7"
      two = :"#{(97 + file).chr}2"
      one = :"#{(97 + file).chr}1"
      self[eight] = pieces_order[file].new(:black, eight)
      self[seven] = Pawn.new(:black, seven)
      self[two] = Pawn.new(:white, two)
      self[one] = pieces_order[file].new(:white, one)
    end
  end

  def alternate
    # This is a simplified board, for testing purposes. This method should be
    # stored away when dev is done. It can also be replaced once gamestate
    # saving and loading is implemented.
    pieces_order = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    8.times do |file|
      eight = :"#{(97 + file).chr}8"
      one = :"#{(97 + file).chr}1"
      self[eight] = pieces_order[file].new(:black, eight)
      self[one] = pieces_order[file].new(:white, one)
    end
    black_pawns = [:b2, :e7, :f7]
    black_pawns.each do |square|
      self[square] = Pawn.new(:black, square)
    end
    white_pawns = [:c2, :e3, :f2]
    white_pawns.each do |square|
      self[square] = Pawn.new(:white, square)
    end
  end

  def display
    # Prints out the board to the terminal.
    count = 0
    rank = 8
    print "   a  b  c  d  e  f  g  h\n"
    self.each do |position, square|
      if count % 8 == 0
        print "#{rank} "
      end
      display_square(position)
      count += 1
      if count % 8 == 0
        print "\e[0m #{rank}\n"
        rank -= 1
      end
    end
    print "   a  b  c  d  e  f  g  h\n"
  end

  def display_square(position)
    # This uses the ASCII value of ranks ('a' == 97) to determine whether a given
    # square should be light or dark.
    file = position[0]
    rank = position[1]
    bgcolor = (file.ord + rank.to_i) % 2 == 0 ? "\e[48;5;8m" : "\e[48;5;7m"
    if self[position].is_a?(Piece)
      print "\e[0m#{bgcolor} #{self[position].symbol} "
    else
      print "#{bgcolor}   "
    end
  end

end
