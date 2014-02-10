(function(root){

	var Node = root.Node = function(value) {
		this.val = value;
		this.right;
		this.left;
	};

	var BinaryTree = root.BinaryTree = function(root) {
		this.root = root;
	};

	BinaryTree.prototype.length = function(node) {
		node = node || this.root;
		return 1 + (node.right ? this.length(node.right) : 0) + (node.left ? this.length(node.left) : 0)
	};
	
	BinaryTree.prototype.insert = function(value, node) {
		this.insertNode(value, this.root);
	};
	
	BinaryTree.prototype.insertNode = function(value, node) {
		if (!node) {
			return new Node(value);
		} else if (node.val > value) {
			node.left = this.insertNode(value, node.left);
		} else {
			node.right = this.insertNode(value, node.right)
		}
		return node;
	};


})(this);
