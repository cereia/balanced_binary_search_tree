# frozen_string_literal: true

# Tree class that holds all methods related to the creation and maintenance of a balanced binary search tree
class Tree
  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree
  end

  def build_tree(arr = @data, start_index = 0, end_index = @data.length - 1)
    return nil if start_index > end_index

    mid = (start_index + end_index) / 2
    node = Node.new(arr[mid])
    node.left_child = build_tree(arr, start_index, mid - 1)
    node.right_child = build_tree(arr, mid + 1, end_index)
    node
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left_child = insert(value, node.left_child)
    elsif value > node.value
      node.right_child = insert(value, node.right_child)
    end
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.value
      node.left_child = delete(value, node.left_child)
    elsif value > node.value
      node.right_child = delete(value, node.right_child)
    else
      # when one or both children are nil, return the non-nil child if one exists
      return node.right_child || node.left_child if node.left_child.nil? || node.right_child.nil?

      # if both children are not nil, the node's value is set to the min value of the node's right descendants
      node.value = min_value(node.right_child)
      node.right_child = delete(node.value, node.right_child)
    end
    node
  end

  def min_value(node)
    min_val = node.value
    # while there is a left child, min value is set to that left child
    while node.left_child
      min_val = node.left_child.value
      node = node.left_child
    end
    min_val
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if value == node.value

    if value < node.value
      find(value, node.left_child)
    elsif value > node.value
      find(value, node.right_child)
    end
  end

  # the &block is an explicit block so the block can be captured and used in subsequent calls of this method
  # using implicit block would only call the block once and every subsequent call would return nothing
  def level_order_recursive(node = @root, queue = [], result = [], &block)
    return result if node.nil?

    # either yield(node) or block.call(node) can be used but block.call(node) preferred for clarity with explicit block
    block_given? ? block.call(node) : result << node.value
    queue << node.left_child if node.left_child
    queue << node.right_child if node.right_child
    level_order_recursive(queue.shift, queue, result, &block)
  end

  # implicit block is used here because this is an iterative method so no need to pass the block over and over again
  def level_order_iterative
    queue = [@root]
    result = []
    until queue.empty?

      node = queue.shift
      block_given? ? yield(node) : result << node.value
      queue << node.left_child if node.left_child
      queue << node.right_child if node.right_child
    end
    result
  end

  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left_child, result, &block)
    block_given? ? block.call(node) : result << node.value
    inorder(node.right_child, result, &block)
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    block_given? ? block.call(node) : result << node.value
    preorder(node.left_child, result, &block)
    preorder(node.right_child, result, &block)
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left_child, result, &block)
    postorder(node.right_child, result, &block)
    block_given? ? block.call(node) : result << node.value
  end

  # height returns -1 if the node isn't present or height value if it is
  def height(node = @root, height = -1)
    return height if node.nil?

    [height(node.left_child, height), height(node.right_child, height)].max + 1
  end

  # depth returns the number of nodes there are from root to chosen node
  def depth(node = @root, parent = @root, depth = 0)
    return depth if node == parent
    return -1 if node.nil?

    if node.value < parent.value
      depth(node, parent.left_child, depth + 1)
    elsif node.value > parent.value
      depth(node, parent.right_child, depth + 1)
    end
  end

  # checks if a tree is balanced
  # check that the difference between the heights of the left and right subtrees of every node is not more than 1
  def balanced?
    nodes = leaf_nodes
    depths = nodes.map { |leaf| depth(leaf) }
    (depths.max - depths.min).between?(-1, 1)
  end

  # look for all the leaf nodes and find the distance from root to each leaf node
  def leaf_nodes
    leafs = []

    inorder { |node| leafs << node if node.left_child.nil? && node.right_child.nil? }
    leafs
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left_child
  end
end
