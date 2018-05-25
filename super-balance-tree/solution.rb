class Solution
  def self.is_super_balanced(tree)
    depts = traverse_and_get_leaf_depths(tree)
    result = depts.inject({result: true, last: nil, acc: 0}) do |acc, item|
      if !acc[:last]
        acc[:last] = item
      else
        sum_of_diff = acc[:acc] + (acc[:last] - item)
        if (sum_of_diff > 1 || sum_of_diff < -1)
          acc[:result] = false
        end
      end
      acc
    end

    return result[:result]
  end

  def self.traverse_and_get_leaf_depths(tree, depth = 0, include_node_value = false)
    if tree.has_left? && tree.has_right?
      [
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
      traverse_and_get_leaf_depths(
        tree.left,
        depth + 1,
        include_node_value
      )

    elsif !tree.has_left? && tree.has_right?
      traverse_and_get_leaf_depths(
        tree.right,
        depth + 1,
        include_node_value
      )
    else
      if include_node_value
        "#{tree.value}, #{depth}"
      else
        depth
      end
    end
  end
end
