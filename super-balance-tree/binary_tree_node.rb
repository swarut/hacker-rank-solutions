class BinaryTreeNode
  # A tree is "superbalanced" if the difference between the depths of any two leaf
  # nodes is no greater than one.
  
  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end

  def has_left?
    @left != nil
  end

  def has_right?
    @right != nil
  end
end
