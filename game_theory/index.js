
var setup = {
	'number_of_hawks': 5,
	'number_of_doves': 5,
	'iterations': 100000,
	'value': 2,
	'cost': 5
};

var hawk = function () {
	var value = 0;

	return {
		'getType': function () {
			return 'hawk';
		},
		'add': function (v) {
			value += v;
		},
		'subtract': function (v) {
			value -= v;
		},
		'getValue': function () {
			return value;
		}
	};
};

var dove = function () {
	var value = 0;

	return {
		'getType': function () {
			return 'dove';
		},
		'add': function (v) {
			value += v;
		},
		'subtract': function (v) {
			value -= v;
		},
		'getValue': function () {
			return value;
		}
	};
};

var players = [];

for (var i = 0; i < setup.number_of_hawks; i++) {
	players.push(hawk());
}
for (var i = 0; i < setup.number_of_doves; i++) {
	players.push(dove());
}

function getRandomInt(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

for (var i = 0; i < setup.iterations; i++) {
	var player1 = players[getRandomInt(0, players.length - 1)];
	var player2 = players[getRandomInt(0, players.length - 1)];
	if (player1.getType() === 'hawk' && player2.getType() === 'hawk') {
		if (getRandomInt(0, 1)) {
			player1.add(setup.value);
			player2.subtract(setup.cost);
		} else {
			player2.add(setup.value);
			player1.subtract(setup.cost);
		}
	} else if (player1.getType() === 'hawk' && player2.getType() === 'dove') {
		player1.add(setup.value);
	} else if (player1.getType() === 'dove' && player2.getType() === 'hawk') {
		player2.add(setup.value);
	} else if (player1.getType() === 'dove' && player2.getType() === 'dove') {
		(getRandomInt(0, 1) ? player1.add(setup.value) : player2.add(setup.value));
	}
}

for (var i = 0; i < players.length; i++) {
	console.log(players[i].getType() + ': ' + players[i].getValue());
}

