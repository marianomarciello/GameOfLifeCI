class Generation
  @row = @col = @generation = 0

  def initialize(row, col, matrix, generation)
    @row = row
    @col = col
    @matrix = matrix
    @generation = generation
  end

  def next
    @generation +=1
    dir = [[-1, -1], [-1, 0], [-1, 1],
           [0, -1], [0, 1],
           [1, -1], [1, 0], [1, 1]]
    tmpMatrix = Array.new(@row){Array.new(@col,0)}

    for i in 0..@row - 1
      for j in 0..@col - 1
        livecount = 0
        for d in dir
          xdir = d[0] + i
          ydir = d[1] + j

          if xdir < @row - 1 and xdir > - 1 and ydir < @col - 1 and ydir > -1
            livecount += @matrix[xdir][ydir]
          end
        end

        if @matrix[i][j] == 0 and livecount == 3
          tmpMatrix[i][j] = 1
        elsif @matrix[i][j] == 1
          if livecount < 2
            tmpMatrix[i][j] = 0
          elsif livecount >= 2 and livecount <= 3
            tmpMatrix[i][j] = 1
          elsif livecount > 3
            tmpMatrix[i][j] = 0
          end
        end
      end
    end
    @matrix = tmpMatrix
  end

  def to_s
    puts `clear`
    retStr = "Generation: #{@generation}\n"
    retStr += "#{@row} #{@col}\n"
    @matrix.each do |row|
      row.each do |col|
        if col == 0
          retStr += "."
        else
          retStr += "*"
        end
      end
      retStr += "\n"
    end
    retStr
  end
end
