class Coord
  attr_accessor :coord, :children, :parent

  def initialize(coord)
    @coord = coord
    @children = []
  end

  # sets all valid possible moves as children of the current coord
  def set_children
    x = coord[0]
    y = coord[1]

    sgn, i, j = 1, 1, 2
    2.times do
      2.times do
      	children << Coord.new([x+i*sgn, y+j*sgn]) if valid_coord?(x+i*sgn, y+j*sgn)
      	children << Coord.new([x-i*sgn, y+j*sgn]) if valid_coord?(x-i*sgn, y+j*sgn)
      	i,j = j,i
      end
      sgn = -1
    end

    set_parent
  end

  def valid_coord?(x,y)
  	return (x <= 7 && x >= 0) && (y <= 7 && y >= 0) ? true : false
  end

  def set_parent
  	children.each { |child| child.parent = self }
  end

end

def knights_moves(start_coord, end_coord, queue = [])
  start_coord = Coord.new(start_coord) if start_coord.kind_of?(Array)
  if start_coord.coord == end_coord
    path = [start_coord.coord]
    until start_coord.parent == nil
      path << start_coord.parent.coord
      start_coord = start_coord.parent
  	end
  	puts "You made it in #{path.length - 1} moves! Here's your path:"
  	path.reverse.each { |step| p step}
  	return 
  end
  start_coord.set_children.each { |child| queue << child }
  knights_moves(queue.shift, end_coord, queue)
end

p knights_moves([3,3],[0,0])




