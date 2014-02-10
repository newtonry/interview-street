(function(root){
	root.coinSums = function(coinset, target) {
		
		var coinsetLength = coinset.length;
		var i;
		var ways = [1];
		
		for(var i=0; i < coinsetLength; i++) {
			var count = coinset[i];
			
			while(count <= target) {
				ways[count] = (ways[count] || 0) + (ways[count - coinset[i]] || 0);
				count++;
			}
		}
		return ways[ways.length - 1];
	}
})(this);