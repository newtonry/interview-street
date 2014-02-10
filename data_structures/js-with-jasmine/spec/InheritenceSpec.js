describe("Inheritance", function() {
	it("should have a common animal roar", function() {
		var unknownAnimal = new Animal('large');
		expect(unknownAnimal.roar()).toEqual('roar!');
	});
	
	it("should allow inheritance of animals", function() {
		var lion = new Lion('large');
		expect(lion.size).toEqual('large');
		expect(lion.roar()).toEqual('roar!');
		expect(lion.bite()).toEqual('ow!');
	});

	it("should allow for animals to have their own call", function() {
		var wolf = new Wolf('medium');
		expect(wolf.roar()).toEqual('howl!');
	});
});