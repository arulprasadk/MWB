function GuessGame(random) {
	var attempts = 0;
	this.random = random, this.getAttempts = function() {
		return attempts
	}
	this.guess = function(number) {
		
		attempts++
		var result = ""
		if (number == random) {
			result = "Got it in attempts = " + attempts
			attempts = 0;
		} else if (number > random) {
			result = "lower it";
		} else {
			result = "higher it";
		}

		return result;
	}
}
var self = new GuessGame(Math.round(Math.random()*100));
function g$()
{
	return self; 
}