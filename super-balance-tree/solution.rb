class Solution
  def self.is_super_balanced(tree)
    depts = traverse_and_get_leaf_depths(tree)
  end

  def self.traverse_and_get_leaf_depths(tree, depth = 0, include_node_value = false)
    if tree.has_left? && tree.has_right?
      return [
        traverse_and_get_leaf_depths(
          tree.left,
          depth + 1,
          include_node_value
        ),
        traverse_and_get_leaf_depths(
          tree.right,
          depth + 1,
          include_node_value
        )
      ].flatten
    elsif tree.has_left? && !tree.has_right?
      return traverse_and_get_leaf_depths(
        tree.left,
        depth + 1,
        include_node_value
      )

    elsif !tree.has_left? && tree.has_right?
      return traverse_and_get_leaf_depths(
        tree.right,
        depth + 1,
        include_node_value
      )
    else
      if include_node_value
        return "#{tree.value}, #{depth}"
      else
        return depth
      end
    end
  end
end
