inp = File.read('aoc4_in.txt')

require 'pry'

n = inp.split("\n").first.split(',').map(&:to_i)
b = inp.split("\n")[2..-1].reject(&:empty?).each_slice(5).to_a
boards = b.map { |s| s.map(&:split).map { |y| y.map(&:to_i) } }
mark = boards.map { |board| board.map { |row| row.map { |_| false } } }

boards_won = { }
(0..boards.size-1).each { |i| boards_won[i] = false }

n.each do |number|
  boards.each_with_index do |board, i|
    board.each_with_index do |row, y|
      next if boards_won[i] == true
      idx = row.index(number)
      if idx
        mark[i][y][idx] = true

        if mark[i][y].uniq == [true] || mark[i][0..5].map { |x| x[idx] }.uniq == [true]
          sum = 0
          mark[i].each_with_index do |row_m, row_idx|
            row_m.each_with_index do |value_m, value_idx|
              sum += board[row_idx][value_idx] unless value_m
            end
          end
          if boards_won.select{ |k,v| v == false }.keys.length == 1
            return puts sum * number
          end
          boards_won[i] = true
        end
      end
    end
  end
end
