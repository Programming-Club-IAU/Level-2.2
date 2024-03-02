import 'dart:io';

String getValidGuess() {
  late String guess;
  bool isValid = false;

  while (!isValid) {
    print("Enter your guess (a single letter): ");
    guess = stdin.readLineSync() ?? "";
    guess = guess.trim().toLowerCase();

    if (guess.length == 1 && guess.contains(RegExp(r'[a-z]'))) {
      isValid = true;
    } else {
      print("Invalid input. Please enter a single letter.");
    }
  }

  return guess;
}