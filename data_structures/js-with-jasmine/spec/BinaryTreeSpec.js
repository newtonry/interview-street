describe("BinaryTree", function(){
	describe("A working node", function() {
		var node1 = new Node(5);
		var node2 = new Node(10);
		var node3 = new Node(3);
		node1.right = node2;
		node1.left = node3;
		
		it("should have a value", function(){
			expect(node1.val).toEqual(5);
		});
		
		it("should have children", function() {
			expect(node1.right.val).toEqual(10);
			expect(node1.left.val).toEqual(3);
		});
	});
	
	describe("A binary tree", function(){
		var bt = new BinaryTree(new Node(5));
		
		it("should have a root", function() {
			expect(bt.root.val).toEqual(5);
		});
		
		it("should have a length function", function(){
			expect(bt.length()).toEqual(1);
		});
	
		describe("Adding a node", function(){
			it("should have add a simple node", function(){
				bt.insert(10);
				expect(bt.length()).toEqual(2);
				expect(bt.root.right.val).toEqual(10);
			});
			
			it("should not have a left child", function(){
				expect(bt.root.left).not.toBeDefined();
			});

			it("should add additional children correctly", function(){
				bt.insert(3);
				expect(bt.length()).toEqual(3);
				expect(bt.root.left.val).toEqual(3);
			});

			it("should add children to the point where it's a tree", function(){
				bt.insert(2);
				expect(bt.length()).toEqual(4);
				expect(bt.root.left.left.val).toEqual(2);
			});
		});
		
		describe("Can check if it's balanced", function(){
			
			
		});
		
	});
});