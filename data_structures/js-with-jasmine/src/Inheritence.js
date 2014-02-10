function Animal(size) {
	this.size = size;
}

Animal.prototype.roar = function() {
	return 'roar!';
};

function Surrogate() {}
Surrogate.prototype = Animal.prototype;

function Lion(size) {
	this.size = size;
};

Lion.prototype = new Surrogate();
Lion.prototype.bite = function() {return 'ow!';};


function Wolf(size) {
	this.size = size;
};

Wolf.prototype = new Surrogate();
Wolf.prototype.roar = function() {return 'howl!';};
