# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/binary_search_tree'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(13)
tree.insert(10)
# tree.delete(8)
p tree.find(43)
puts "find return: #{tree.find(9)}"

tree.pretty_print

# test = Tree.new([20, 30, 40, 50, 60, 70, 80])
# test.delete(50)
# test.pretty_print
