require_relative '../binary_tree_node'

RSpec.describe BinaryTreeNode, "insert_left" do
  it "inserts new node to the left" do
    b1 = BinaryTreeNode.new("b1")
    b2 = b1.insert_left("b2")
    expect(b1.left).to eq b2
  end
end

RSpec.describe BinaryTreeNode, "insert_right" do
  it "inserts new node to the right" do
    b1 = BinaryTreeNode.new("b1")
    b2 = b1.insert_right("b2")
    expect(b1.right).to eq b2
  end
end

RSpec.describe BinaryTreeNode, "has_left?" do
  context "with left node" do
    it "be true" do
      b1 = BinaryTreeNode.new("b1")
      b2 = b1.insert_left("b2")
      expect(b1.has_left?).to eq true
    end
  end
  context "without left node" do
    it "be false" do
      b1 = BinaryTreeNode.new("b1")
      expect(b1.has_left?).to eq false
    end
  end
end

RSpec.describe BinaryTreeNode, "has_right?" do
  context "with right node" do
    it "be true" do
      b1 = BinaryTreeNode.new("b1")
      b2 = b1.insert_right("b2")
      expect(b1.has_right?).to eq true
    end
  end
  context "without right node" do
    it "be false" do
      b1 = BinaryTreeNode.new("b1")
      expect(b1.has_right?).to eq false
    end
  end
end
