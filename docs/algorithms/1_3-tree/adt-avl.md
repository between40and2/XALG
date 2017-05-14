
# Self-balancing = AVL Tree

* First of all, AVL Tree is a BST, that BST properties should hold true.
* Secondly, AVL Tree has its own properties,

In XALG, Tree_AVLTree is a subclass of Tree_BST, which only `balance(node:)` method has been overridden. `search(key:)` method of AVL Tree is same implementation as of BST.



[www.hackerrank.com: Balanced Trees Challenges](https://www.hackerrank.com/domains/data-structures/balanced-trees)


BF(A)| Factors | Status | Actions
--|--|--|--
2 | BF(A->left) == 1 | LL | Right Rotate
-2 | BF(A->right) == -1 | RR | Left Rotate
2 | BF(A->left) == -1 | LR | A.left Left Rotate; A Right Rotate
-2 | BF(A->right) == -1 | RR | A.right Right Rot; A Left Rotate


## RB Tree vs AVL Trees


* http://discuss.fogcreek.com/joelonsoftware/default.asp?cmd=show&ixPost=22948
* http://stackoverflow.com/questions/13852870/red-black-tree-over-avl-tree
* google : difference between red-black tree and avl


### AVL

* https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-6-avl-trees-avl-sort/
