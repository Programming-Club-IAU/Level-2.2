/* String getValidGuess() {
-The getValidGuess function prompts the player to enter a guess.
-It uses a loop to ensure that the input is a valid guess.
-It reads the input from the user, trims and converts it to lowercase, and validates it using a regular expression.
} */

import 'dart:io';

String getValidGuess(){
  bool valid=false;
  String letter;
  RegExp lowCase=RegExp(r'[a-z]');
  do{
  print("\nEnter your gusss(a single letter): ");
  letter=stdin.readLineSync()!;
  letter.trim();
  letter.toLowerCase();
  if(lowCase.hasMatch(letter))
    valid=true;
  else
    print("invalid guess try again");
  

  }while(!valid);

  return letter;

  
  


}