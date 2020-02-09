require_relative 'grid'

# Implementation representation of the Game fo Life
class Engine

  def initialize(rows=10, cols=10)
    @rows = rows
    @cols = cols
    @live_cell = '*'
    @dead_cell = '_'
    @grid = Grid.new rows, cols
    @grid.reset(@dead_cell)
  end  

  # Seeds the gird using a basic |(pipe) delimted format
  def seed record
    split = record.split '|'
    r = 0
    split.each do |row|
      0.upto(row.length-1) do |c|
        @grid.set_at(r, c, row[c])
      end    
      r += 1  
    end  
  end    

  def alive_neighbours(row, col)
    alive_neighbours = 0; 
    #Do the around 
    for i in -1..1 do 
      for j in -1..1 do 
        # Skip yourself
        if i == 0 && j == 0
          # Skip myself
        else    
          if @grid.get_at(row + i, col + j) == @live_cell
            alive_neighbours += 1
          end
        end    
      end
    end
    return alive_neighbours      
  end  

  def live?(row, col)
    # To Stay alive a cell must be alive
    if(@grid.get_at(row, col) == @live_cell)
      count_neighbours = alive_neighbours row, col
      return count_neighbours == 2 || count_neighbours == 3 
    end 
    return false
  end

  def produce?(row, col)
    if(@grid.get_at(row, col) == @dead_cell)
      count_neighbours = alive_neighbours row, col
      return count_neighbours == 3 
    else
      return false
    end      
  end 

  def die?(row, col)
    # Only living cells can die so check for that
    if(@grid.get_at(row, col) == @live_cell)
      count_neighbours = alive_neighbours row, col  
      return count_neighbours < 2 || count_neighbours > 3
    else
      return true        
    end    
  end  

  # Represents a single turn in the game - this is a pro life version. Checks reproduction before living and dying
  def evolve
    0.upto(@rows-1).each do |r|  
        0.upto(@cols-1) do |c|
          if produce? r, c
            @grid.set_at(r, c, @live_cell)
          end              
        end  
      end
    0.upto(@rows-1).each do |r|  
      0.upto(@cols-1) do |c|
        if live? r, c
          @grid.set_at(r, c, @live_cell)
        else
          if die? r, c
            @grid.set_at(r, c, @dead_cell)
          end      
        end                
      end  
    end
  end  

  def print
    @grid.print
  end  

end