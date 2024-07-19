# frozen_string_literal: true

# Tree class that holds all methods related to the creation and maintenance of a balanced binary search tree
class Tree
  def initialize(array)
    @root = build_tree
    @data = array.sort.uniq
  end

  def build_tree(arr = @data, start_index = 0, end_index = @data.length - 1)
    return nil if start_index > end_index

    mid = (start_index + end_index) / 2
    node = Node.new(arr[mid])
    node.left = build_tree(arr, start_index, mid - 1)
    node.right = build_tree(arr, mid + 1, end_index)
    node
  end
end
