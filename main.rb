# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/binary_search_tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts '-----------------------initial tree-----------------------'
tree.pretty_print
puts "balanced? #{tree.balanced?}"
puts "level order: #{tree.level_order_recursive}"
puts "preorder: #{tree.preorder}"
puts "postorder: #{tree.postorder}"
puts "inorder: #{tree.inorder}"
tree.insert(124)
tree.insert(153)
tree.insert(101)
tree.insert(2342)
tree.insert(1231)
puts '-----------------------tree after insertion-----------------------'
tree.pretty_print
puts "balanced? #{tree.balanced?}"
tree.rebalance
puts '-----------------------tree after rebalance-----------------------'
tree.pretty_print
puts "balanced? #{tree.balanced?}"
puts "level order: #{tree.level_order_recursive}"
puts "preorder: #{tree.preorder}"
puts "postorder: #{tree.postorder}"
puts "inorder: #{tree.inorder}"
