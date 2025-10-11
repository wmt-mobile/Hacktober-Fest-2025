import 'dart:io';

void main() {
  final options = ['rock', 'paper', 'scissors'];

  print('=== Rock Paper Scissors (2 Players) ===');
  print('Valid choices: rock, paper, scissors\n');

  while (true) {
    // Player 1 input
    stdout.write('Player 1, enter your choice (or type "exit" to quit): ');
    String? player1 = stdin.readLineSync()?.toLowerCase();

    if (player1 == 'exit') {
      print('\nGame ended. 👋');
      break;
    }

    if (!options.contains(player1)) {
      print('Invalid input by Player 1! Please enter rock, paper, or scissors.\n');
      continue;
    }

    // Player 2 input
    stdout.write('Player 2, enter your choice (or type "exit" to quit): ');
    String? player2 = stdin.readLineSync()?.toLowerCase();

    if (player2 == 'exit') {
      print('\nGame ended. 👋');
      break;
    }

    if (!options.contains(player2)) {
      print('Invalid input by Player 2! Please enter rock, paper, or scissors.\n');
      continue;
    }

    print('\n--- Result ---');
    print('Player 1 chose: $player1');
    print('Player 2 chose: $player2');

    // Compare choices
    if (player1 == player2) {
      print('It\'s a draw! 😐\n');
    } else if ((player1 == 'rock' && player2 == 'scissors') ||
        (player1 == 'paper' && player2 == 'rock') ||
        (player1 == 'scissors' && player2 == 'paper')) {
      print('Player 1 wins! 🎉\n');
    } else {
      print('Player 2 wins! 🏆\n');
    }
  }
}
