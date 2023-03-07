require_relative "generation"

def parseFile(fileName)
  _matrix = Array.new
  _row = 0
  _col = 0
  _generation = -1
  _row_num = 0

  # first line header: "Generation N:"
  # second line row column
  # matrix representation
  File.open(fileName).each do |line|
    if line =~ /^Generation/
      _generation = line.split(/ /, 2)[1]
      _generation.delete! ':'
      _generation = _generation.to_i
      next
    elsif line =~ /^\d+/
      _row = line.split(" ", 2)[0].to_i
      _col = line.split(" ", 2)[1].to_i
      next
    end

    if _row != 0 and _col != 0
      _col_num = 0
      _row_tmp = Array.new
      line.each_char { |c|
        if c != "\n"
          _col_num += 1
          if c == "."
            _row_tmp << 0
          elsif c == "*"
            _row_tmp << 1
          end
        else
          _matrix << _row_tmp
          _row_tmp = Array.new
          if _col_num != _col
            raise "Error, malformed matrix max column index: " + _col.to_s +
                  " found column index: "+ _col_num.to_s
          end
          _row_num += 1
        end
      }
      if _row_num > _row
        raise "Error, malformed matrix max row index: " + _row.to_s +
              " found row index: "+ _row_num.to_s
      end
    end
  end
  if _generation == -1 or _row == 0 or _col == 0
    raise "Error, malformed input file: #{fileName}"
  end

  Generation.new(_row, _col, _matrix, _generation)
end
