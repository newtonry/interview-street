describe("Coin sums", function() {
	
	it("should return 1, when there are only ones", function(){
		var ways = coinSums([1], 5);
		expect(ways).toEqual(1);
	});


	it("should have 2 ways to make 3 from [1,2]", function(){
		var ways = coinSums([1,2], 3);
		expect(ways).toEqual(2);
	});

	it("should return 73682, for a british coinset and total of 200", function(){
		var ways = coinSums([1,2,5,10,20,50,100,200], 200);
		expect(ways).toEqual(73682);
	});
});

  // 	
  // var player;
  // var song;
  // 
  // beforeEach(function() {
  //   player = new Player();
  //   song = new Song();
  // });
  // 
  // it("should be able to play a Song", function() {
  //   player.play(song);
  //   expect(player.currentlyPlayingSong).toEqual(song);
  // 
  //   //demonstrates use of custom matcher
  //   expect(player).toBePlaying(song);
  // });
  // 
  // describe("when song has been paused", function() {
  //   beforeEach(function() {
  //     player.play(song);
  //     player.pause();
  //   });
  // 
  //   it("should indicate that the song is currently paused", function() {
  //     expect(player.isPlaying).toBeFalsy();
  // 
  //     // demonstrates use of 'not' with a custom matcher
  //     expect(player).not.toBePlaying(song);
  //   });
  // 
  //   it("should be possible to resume", function() {
  //     player.resume();
  //     expect(player.isPlaying).toBeTruthy();
  //     expect(player.currentlyPlayingSong).toEqual(song);
  //   });
  // });
  // 
  // // demonstrates use of spies to intercept and test method calls
  // it("tells the current song if the user has made it a favorite", function() {
  //   spyOn(song, 'persistFavoriteStatus');
  // 
  //   player.play(song);
  //   player.makeFavorite();
  // 
  //   expect(song.persistFavoriteStatus).toHaveBeenCalledWith(true);
  // });
  // 
  // //demonstrates use of expected exceptions
  // describe("#resume", function() {
  //   it("should throw an exception if song is already playing", function() {
  //     player.play(song);
  // 
  //     expect(function() {
  //       player.resume();
  //     }).toThrowError("song is already playing");
  //   });
  // });
// });
