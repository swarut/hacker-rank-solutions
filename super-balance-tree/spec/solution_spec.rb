require_relative '../solution'

RSpec.describe Solution, "" do
  context "1" do
    it "should be true" do
      #        1
      #      2   3
      #    4  5
      s = Solution.new
      b1 = BinaryTreeNode.new("b1")
      b2 = BinaryTreeNode.new("b2")
      b3 = BinaryTreeNode.new("b3")
      b4 = BinaryTreeNode.new("b4")
      b5 = BinaryTreeNode.new("b5")
      b2.insert_left(b4)
      b2.insert_right(b5)
      b1.insert_left(b2)
      b1.insert_right(b3)


      expect(Solution.is_super_balanced(b1)).to eq true
    end
  end
end
