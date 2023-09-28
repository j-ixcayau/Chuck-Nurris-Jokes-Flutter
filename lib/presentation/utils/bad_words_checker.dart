import 'package:chuck_norris_jokes/presentation/utils/worlds_list.dart';

/// Bad Word Filter
class BadWorkdsChecker {
  /// isProfane returns a boolean value representing if the string provided contains a profane word
  static bool isProfane(String stringToTest) {
    final lowerCaseStringToTest = stringToTest.toLowerCase();
    return wordList
        .where((word) => lowerCaseStringToTest.contains(word))
        .isNotEmpty;
  }

  /// replace tests a string, replacing bad words with an asterisk length string of equal length
  static String clean(String value) {
    final wordsToClean = value.split(' ');

    final clean = wordsToClean.map(
      (word) {
        if (wordList.contains(word.toLowerCase())) {
          return _cleanWord(word);
        }

        return word;
      },
    );

    return clean.join(' ');
  }

  static String _cleanWord(String word) {
    String newWord = '';

    for (int i = 0; i < word.length; i++) {
      if ((i % 2) == 0) {
        newWord += word[i];
      } else {
        newWord += '*';
      }
    }

    return newWord;
  }
}
