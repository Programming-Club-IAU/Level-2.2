
import 'dart:io';
import 'dart:math';
import 'guess.dart';

void hangman() {
  print("Welcome to Hangman!");
  List<String> words = ["program", "flower", "flutter", "monster"];
  
  int? attempt;
  int index;
  String word;
  int end = 0;
  bool c ;
  List<String> guessed = [];

  do {
    attempt = 10;
    c=false;
    index = Random().nextInt(words.length);
    word = words.elementAt(index);
    List<String> correct =[];
    
    
    while (attempt != 0) {
      stdout.write("Word: ");
      for (int i = 0; i < word.length; i++) {
        List temp = word.split('');
        if (inGuessList(temp[i], guessed))
          stdout.write(" ${temp[i]} ");
        else
          stdout.write(" _ ");
      }
      stdout.write("\nGussed letters: ");

      guessed.forEach((element) {
        stdout.write(element + ", ");
      });

      print("\nNumber of attempts left: $attempt");

      String guess = getValidGuess();

      while (inGuessList(guess, guessed)) {
        print("You already enterd this letter. Try Again!");
        guess = getValidGuess();
      }

      guessed.add(guess);

      if (word.contains(guess)) {
        
        correct.add(guess);
        
        print("correct!");
      } else
        print("Incorrect!");


      
      if (word.length==correct.length) {
        c = true;
      }

      
      if (c) {
        print("Congratulations! You gussed the word: $word");
        break;
      }
      attempt = attempt! - 1;
    }
    if (!c) {
      print("You ran out of attempts. The correct word was: $word");
    }
    try{
    print("Want to play again (enter 0 for NO, otherwisr enter any number): ");
    end = int.parse(stdin.readLineSync()!);
    }
    catch(e){
      print("invalid input!\nWant to play again (enter 1 for YES, 0 for NO): ");
      end = int.parse(stdin.readLineSync()!);
    }
    
    guessed.clear();
    correct.clear();
  } while (end != 0);
}

bool inGuessList(String n, List<String> guessed) {
  for (String letter in guessed) {
    if (n == letter) {
      return true;
    }
  }

  return false;
}
