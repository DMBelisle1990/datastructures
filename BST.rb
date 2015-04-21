class Node
  attr_accessor :value, :left_child, :right_child, :parent

  def initialize(value)
  	@value = value
  end

  def set_child(value)
  	if value < @value
  	   @left_child ? @left_child.set_child(value) : @left_child = Node.new(value)
  	else
  	   @right_child ? @right_child.set_child(value) : @right_child = Node.new(value)
  	end
  end

  def build_tree(num_array)
  	num_array.each { |num| set_child(num) }
  end

  def breadth_first_search(target, queue = [])
  	return self if @value == target
  	queue << @left_child unless @left_child.nil?
  	queue << @right_child unless @right_child.nil?
  	(queue.shift).breadth_first_search(target, queue) unless queue.first.nil?
    nil
  end

  def depth_first_search(target)

  end

  def dfs_rec(target)
  	return self if @value == target
  	return nil unless @right_child || @left_child
  	temp = @right_child.dfs_rec(target) if @right_child
  	temp = @left_child.dfs_rec(target) if temp.nil? && @left_child
  	temp
  end

end

node = Node.new(24)
node.build_tree([1,3,8,5,37,68,100,4,6])
three_node = node.dfs_rec(5)
puts three_node.right_child.value



