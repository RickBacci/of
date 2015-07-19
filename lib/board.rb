require 'pry'
require_relative 'cell'

class Board
  include Enumerable

  attr_accessor :board_height, :board_width, :cell_size,
                :starting_board, :total_columns

  def each(&block)
    @cells.each(&block)
  end

  def self.cells
    @cells
  end

  def self.cell_size
    @cell_size
  end

  def self.board_width
    starting_board.size
  end

  def self.board_height
    starting_board.count
  end

  def self.generate_cells(starting_board, board_width, board_height, cell_size=1)
   # @width = width
   # @height = height
   # @cell_size = cell_size
    @cells = []
    starting_board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cells << Cell.new(x: x, y: y,
                          current_state: cell,
                          cell_size: cell_size,
                          board_width: board_width,
                          board_height: board_height)
      end
    end
    cells
  end

  def self.get_cell(x, y)
    cells.detect { |cell| cell.x == x && cell.y == y }
  end
end

