
# Represents an generic grid datastructure
# Can be used with and type of two dimensional problem
class Grid

  def initialize(rows, cols)
    @rows = rows
    @cols = cols

    @grid = []
    0.upto(rows-1).each do |r|
      @grid << []
      0.upto(cols-1) do
        @grid[r] << nil
      end  
    end    
  end  

  def get
    @grid
  end  

  def get_at(row, col)
    if @grid[row]
      return @grid[row][col]
    else
      return nil
    end    
  end 
  
  def set_at(row, col, val)
    if @grid[row]  
      @grid[row][col] = val
    end  
  end

  def reset(val)
    @grid = []
    0.upto(@rows-1).each do |r|
      @grid << []
      0.upto(@cols-1) do
        @grid[r] << val
      end  
    end
  end 
  
  def print
    0.upto(@rows-1).each do |r|
      row = ""  
      0.upto(@cols-1) do |c|
        row += @grid[r][c]
      end  
      puts row
    end
  end  

end