# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/binary_search_tree'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(13)
tree.insert(10)
tree.insert(432)
# tree.insert(2)
# tree.insert(6)
# tree.delete(5)
# tree.delete(23)
# tree.delete(8)
p tree.find(43)
puts "find return: #{tree.find(432)}"
puts "find return: #{tree.find(9)}"
# p tree.level_order_recursive
# tree.level_order_recursive { |node| puts "current node value: #{node}" }
# p tree.level_order_iterative
# tree.level_order_iterative { |node| puts "current node value: #{node}" }
# p tree.inorder
# tree.inorder { |node| puts "in order: #{node}" }
# p tree.preorder
# p tree.postorder
puts "height of node with val 9: #{tree.height(tree.find(9))}"
# puts "depth of node with val 9: #{tree.depth(tree.find(9))}"
# puts "depth of node with val 43: #{tree.depth(tree.find(43))}"
# puts "depth default: #{tree.depth}"
puts "balanced? #{tree.balanced?}"
tree.pretty_print
# tree.rebalance
# puts "balanced? #{tree.balanced?}"
# tree.pretty_print

# test = Tree.new([20, 30, 40, 50, 60, 70, 80])
# test.delete(50)
# test.pretty_print
