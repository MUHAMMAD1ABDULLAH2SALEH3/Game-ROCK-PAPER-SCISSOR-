import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

class RockPaperScissors {
  late Move playerMove;
  final Random rng = Random();

  void play() {
    print("Enter your move (r/p/s): ");
    var playerInput = stdin.readLineSync();

    if (playerInput == 'r') {
      playerMove = Move.rock;
    } else if (playerInput == 's') {
      playerMove = Move.scissors;
    } else if (playerInput == 'p') {
      playerMove = Move.paper;
    }

    if (playerInput == 'r' || playerInput == 's' || playerInput == 'p') {
      var aiMove = Move.values[rng.nextInt(3)];

      print("Your move: $playerMove");
      print("Computer's move: $aiMove");

      if (playerMove == aiMove) {
        print("It's a draw");
      } else if ((playerMove == Move.rock && aiMove == Move.scissors) ||
          (playerMove == Move.paper && aiMove == Move.rock) ||
          (playerMove == Move.scissors && aiMove == Move.paper)) {
        print("You win!");
      } else {
        print("You lose!");
      }
    } else {
      print("Invalid input. Please enter 'r', 'p', or 's'.");
    }
  }
}

void main() {
  var game = RockPaperScissors();
  game.play();
}