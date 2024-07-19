# frozen_string_literal: true

# Node class for a binary search tree that holds its own value and any children
class Node
  def initialize(data)
    @value = data
    @left_child = nil
    @right_child = nil
  end
end
