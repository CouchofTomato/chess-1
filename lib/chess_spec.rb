require 'chess_class'

describe Chess do
  let(:game) { Chess.new }

  describe "#initialize" do
    context "when initializing the board" do
      class Chess
        attr_reader :board
      end
      it "creates a 64-element hash" do
        expect(game.board.length).to eq(64)
      end

      it "has symbols as keys and Pieces or spaces as values (1)" do
        expect(game.board[:a1]).to be_a(Piece)
      end

      it "has symbols as keys and Pieces or spaces as values (2)" do
        expect(game.board[:a4]).to eq(' ')
      end

    end
  end

  describe "#initialize_board" do
    class Chess
      attr_reader :board
    end

    it "is a Hash" do
      board = game.initialize_board
      expect(board).to be_a(Hash)
    end
  end

  describe "#display_board" do
    it "displays the current state of the board" do
      starting_board = <<~BRD
         a  b  c  d  e  f  g  h
      8 \e[43m ♖ \e[40m ♘ \e[43m ♗ \e[40m ♕ \e[43m ♔ \e[40m ♗ \e[43m ♘ \e[40m ♖ \e[0m 8
      7 \e[40m ♙ \e[43m ♙ \e[40m ♙ \e[43m ♙ \e[40m ♙ \e[43m ♙ \e[40m ♙ \e[43m ♙ \e[0m 7
      6 \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[0m 6
      5 \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[0m 5
      4 \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[0m 4
      3 \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[40m   \e[43m   \e[0m 3
      2 \e[43m ♟ \e[40m ♟ \e[43m ♟ \e[40m ♟ \e[43m ♟ \e[40m ♟ \e[43m ♟ \e[40m ♟ \e[0m 2
      1 \e[40m ♜ \e[43m ♞ \e[40m ♝ \e[43m ♛ \e[40m ♚ \e[43m ♝ \e[40m ♞ \e[43m ♜ \e[0m 1
         a  b  c  d  e  f  g  h
        BRD
      expect { game.display_board }.to output(starting_board).to_stdout
    end
  end

  describe "#display_square" do
    context "when given a starting a1 square" do
      after(:each) do
        puts "\e[0m"
      end

      it "prints out a black square with a white rook" do
        expect { game.display_square(:a1) }.to output("\e[40m ♜ ").to_stdout
      end
    end
  end
end

describe Piece do

  describe "#initialize" do
    let(:piece) { Piece.new(:black, :e5) }

    it "is a Piece" do
      expect(piece).to be_an_instance_of(Piece)
    end

    it "is black" do
      expect(piece.color).to eq(:black)
    end

    it "has a position of e5" do
      expect(piece.position).to eq(:e5)
    end
  end
end

describe King do
  describe "#initialize" do
    let(:king) { King.new(:white, :e1) }

    it "is a Piece" do
      expect(king).to be_a(Piece)
    end

    it "is a King" do
      expect(king).to be_an_instance_of(King)
    end

    it "is white" do
      expect(king.color).to eq(:white)
    end

    it "has a symbol of ♚" do
      expect(king.symbol).to eq('♚')
    end

    it "has a position of e1" do
      expect(king.position).to eq(:e1)
    end
  end
end

describe Queen do
  describe "#initialize" do
    let(:queen) { Queen.new(:black, :d8) }

    it "is a Piece" do
      expect(queen).to be_a(Piece)
    end

    it "is a Queen" do
      expect(queen).to be_an_instance_of(Queen)
    end

    it "is black" do
      expect(queen.color).to eq(:black)
    end

    it "has a symbol of ♕" do
      expect(queen.symbol).to eq('♕')
    end

    it "has a position of d8" do
      expect(queen.position).to eq(:d8)
    end
  end
end

describe Rook do
  describe "#initialize" do
    let(:rook) { Rook.new(:white, :a1) }

    it "is a Piece" do
      expect(rook).to be_a(Piece)
    end

    it "is a Rook" do
      expect(rook).to be_an_instance_of(Rook)
    end

    it "is white" do
      expect(rook.color).to eq(:white)
    end

    it "has a symbol of ♜" do
      expect(rook.symbol).to eq('♜')
    end

    it "has a position of a1" do
      expect(rook.position).to eq(:a1)
    end
  end
end

describe Bishop do
  describe "#initialize" do
    let(:bishop) { Bishop.new(:black, :f8) }

    it "is a Piece" do
      expect(bishop).to be_a(Piece)
    end

    it "is a Bishop" do
      expect(bishop).to be_an_instance_of(Bishop)
    end

    it "is black" do
      expect(bishop.color).to eq(:black)
    end

    it "has a symbol of ♗" do
      expect(bishop.symbol).to eq('♗')
    end

    it "has a position of f8" do
      expect(bishop.position).to eq(:f8)
    end
  end
end

describe Knight do
  describe "#initialize" do
    let(:knight) { Knight.new(:white, :b1) }

    it "is a Piece" do
      expect(knight).to be_a(Piece)
    end

    it "is a Knight" do
      expect(knight).to be_an_instance_of(Knight)
    end

    it "is white" do
      expect(knight.color).to eq(:white)
    end

    it "has a symbol of ♞" do
      expect(knight.symbol).to eq('♞')
    end

    it "has a position of b1" do
      expect(knight.position).to eq(:b1)
    end
  end
end

describe Pawn do
  describe "#initialize" do
    let(:pawn) { Pawn.new(:black, :a7) }

    it "is a Piece" do
      expect(pawn).to be_a(Piece)
    end

    it "is a Pawn" do
      expect(pawn).to be_an_instance_of(Pawn)
    end

    it "is black" do
      expect(pawn.color).to eq(:black)
    end

    it "has a symbol of ♙" do
      expect(pawn.symbol).to eq('♙')
    end

    it "has a position of a7" do
      expect(pawn.position).to eq(:a7)
    end
  end

end
