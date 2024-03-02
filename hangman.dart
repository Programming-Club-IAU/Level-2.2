import 'dart:math';
import 'guess.dart';

void hangman() {
  print("Welcome to Hangman!");

  List<String> words = ["programming", "hangman", "dart", "flutter", "developer"];
  String selectedWord = words[Random().nextInt(words.length)];
  List<String> guessedLetters = [];
  int attemptsLeft = 6;

  while (attemptsLeft > 0) {
    // Display current state of the word
    print("\nWord: ${displayWord(selectedWord, guessedLetters)}");
    print("Guessed Letters: ${guessedLetters.join(", ")}");
    print("Attempts Left: $attemptsLeft");

    // Get player's guess
    String guess = getValidGuess();
    guessedLetters.add(guess);

    // Check if the guess is correct
    if (selectedWord.contains(guess)) {
      print("Correct!");
      if (wordGuessed(selectedWord, guessedLetters)) {
        print("Congratulations! You guessed the word: $selectedWord");
        break;
      }
    } else {
      print("Incorrect!");
      attemptsLeft--;
      if (attemptsLeft == 0) {
        print("Sorry, you ran out of attempts. The correct word was: $selectedWord");
      }
    }
  }
}

String displayWord(String word, List<String> guessedLetters) {
  return word.split('').map((letter) {
    return guessedLetters.contains(letter) ? letter : '_';
  }).join(' ');
}

bool wordGuessed(String word, List<String> guessedLetters) {
  return word.split('').every((letter) => guessedLetters.contains(letter));
}

