module ItemsHelper

  
  def tile_sizer item

    size = item.children.size
    if size > 4
      "size-2"
    else
      "size-1"
    end
    "size-2"
  end

  def micro_tile_sizer item
    psize = item.parent.size
    
    
    size = item.children.size
    if size > 4
      "m-size-2"
    else
      "m-size-1"
    end
    

  end
  

  def new_grid_helper(array, columns)
    @grid = Grid_helper.new(columns)
    @grid.insert(array)
    @grid.grid
  end
  
  
  class Grid_helper

    def initialize(columns)
      @columns = columns
      @grid = []
    end

    def [](row, col)
      return (-1) if col >= @columns
      @grid[row*@columns + col] ? @grid[row*@columns + col] : @grid[row*@columns + col]=0
    end

    def []=(row, col, newvalue)
      raise "Can't set a box outside of the grid" if col >= @columns
      @grid[row*@columns + col] = newvalue
    end

    def insert(array)
      array.each do |item|
        raise "#{item} does not have a size" if item.size.nil?
        raise "#{item} is too large!!" if item.size > @columns
        y, x = free_space_for(item.size)
        item.size.times do |row|
          item.size.times do |col|
            self[y + row, x + col] = (-1)
          end
        end
        self[y,x] = item
      end
    end

    def free_space_for(size)
      raise "#{size} is too large!!" if size > @columns
      result = false
      x, y = -1, 0
      while result == false
        x += 1
        y, x = y+1, 0 if x >= @columns
        hopefulls = []

        size.times do |row|
          size.times do |col|
            hopefulls << self[(y + row), (x + col)]
          end
        end
        
        return y, x if hopefulls.all? { |hopefull| hopefull == 0 }
      end
    end

    def grid
      @grid
    end

    def show_grid
      output = ""
      @grid.each_with_index do |item, index|
        output += "#{item},"
        output += "<br>" if ((index+1) % @columns) == 0
      end
      output
    end

  end
  
end
