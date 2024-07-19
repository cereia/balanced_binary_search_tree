# balanced_binary_search_tree

The goal is to build a balanced binary search tree with a Node class and a Tree class with the following methods:
- #build_tree which takes an array of data and turns it into a tree of Node objects
- #insert method which accepts a value to be added to the appropriate leaf node as a child
- #delete method which removes the value given
- #find method which accepts a value and returns the corresponding node 
- #level_order method which accepts a block and should traverse the tree in a breadth-firsst level order and yield each node to the provided block. This method should return an array of values if no block is given.
- #inorder, #preorder, and #postorder methods that accept a block and traverse the tree in their respective depth-first order and yield each node to the given block. If a block isn't given, the method should return an array of values.
- #height method that accepts a node and returns its height, or the distance from this node to its furthest descendent leaf node.
- #depth method that accepts a node and returns its depth, or the distance from this node to the tree's root node.
- #balanced? method checks if a tree is balanced or not, which is determined by the difference between the height of the left subtree and the right subtree being no more than 1.
- #rebalance method which rebalances the subtree if it's not balanced