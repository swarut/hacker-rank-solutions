require_relative '../solution'

RSpec.describe Solution, "traverse_and_get_leaf_depths" do
  it "collects leaf nodes with depth" do
    b1 = BinaryTreeNode.new("b1")
    b2 = b1.insert_left("b2")
    b2.insert_left("b3")
    b4 = b2.insert_right("b4")
    b4.insert_left("b5")
    b4.insert_right("b6")

    result = Solution.traverse_and_get_leaf_depths(b1, 0, true)
    expect(result).to eq ["b3, 2", "b5, 3", "b6, 3"]
  end

  it "collects depth of leaf nodes" do
    b1 = BinaryTreeNode.new("b1")
    b2 = b1.insert_left("b2")
    b2.insert_left("b3")
    b4 = b2.insert_right("b4")
    b4.insert_left("b5")
    b4.insert_right("b6")

    result = Solution.traverse_and_get_leaf_depths(b1)
    expect(result).to eq [2, 3, 3]
  end
end
