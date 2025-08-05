class Life
  attr_accessor :grid, :population, :generation, :width, :height

  DEAD = false
  ALIVE = true

  def initialize(width, height, positions)
    @generation = 0
    @population = positions.length
    @width = width
    @height = height

    genesis positions
  end

  def genesis(positions)
    @grid = Array.new(@height) { Array.new(@width, DEAD) }
    positions.each { |x, y| @grid[y][x] = ALIVE }
  end

  def do_the_evolution
    @generation += 1
    @population = 0
    new_grid = Array.new(@height) { Array.new(@width, DEAD) }
    @grid.each_with_index do |row, y|
      row.each_with_index do |item, x|
        n = 0
        (y - 1).step(y + 1, 1) do |yprime|
          (x - 1).step(x + 1, 1) do |xprime|
            n += 1 if @grid[(yprime + @height) % @height][(xprime + @width) % @width] == ALIVE
          end
        end
        n -= 1 if item == ALIVE
        new_grid[y][x] = (n == 3 || (n == 2 && item))
        @population += 1 if new_grid[y][x]
      end
    end
    @grid = new_grid
  end

  def show()
    @grid.each do |row|
      row.each do |cell|
        print(cell == ALIVE ? "\u25a0" : ' ')
      end
      puts
    end
  end

  def self.glider(width, height)
    positions = [
      [0, 1],
      [1, 2],
      [2, 0],
      [2, 1],
      [2, 2]
    ]
    Life.new(width, height, positions)
  end

  def self.random(width, height, density = 0.2)
    positions = []
    total_cells = width * height
    (total_cells * density).to_i.times do
      positions << [rand(width), rand(height)]
    end
    Life.new(width, height, positions)
  end
end

