import 'dart:io';
import 'dart:math';

import 'package:friend_conversation_dart/friend_conversation_dart.dart'
    as friend_conversation_dart;

void main(List<String> arguments) async {
  print('Hello world: ${friend_conversation_dart.calculate()}!');

  SomeOne paulo = SomeOne("Paulo", "Petrolina/PE");
  SomeOne jose = SomeOne("jose", 'Juazeiro/Ba');
  String? ask;
  String? answer;

  Random interaction = Random();

  do {
    print('${paulo.getName()}:');
    ask = await paulo.question(interaction.nextInt(5));
    print(ask);

    print('${jose.getName()}:');
    answer = await paulo.ask(ask, jose);
    print(answer);
  } while (!ask.contains('bye') || !answer.contains('bye'));
}

class SomeOne {
  String name;
  String cityOfBirth;

  SomeOne(this.name, this.cityOfBirth);

  String getName() {
    return this.name;
  }

  String getCityOfBirth() {
    return this.cityOfBirth;
  }

  Future<String> ask(String? ask, SomeOne someOne) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      switch (ask) {
        case 'Hi!':
          return 'Hi, bro!';
        case 'What have you been?':
          return 'I am doing great, $name';
        case 'where are you from?':
          return 'I am from  ${someOne.getCityOfBirth()}';
        case 'bye!':
          return 'it was good to see ya. bye!';
        case 'puts!':
          throw Exception();
          return 'see ya!';
        default:
          return "Never mind.";
      }
    } catch (e) {
      print("Sorry! I bit my tongue: $e");
      return "Let's try to talk again!";
    }
  }

  Future<String> question(int question) async {
    await Future.delayed(Duration(seconds: 2));
    switch (question) {
      case 1:
        return 'Hi';
      case 2:
        return 'What have you been?';
      case 3:
        return 'where are you from?';
      case 4:
        return 'bye!';
      case 0:
        return 'puts!';
      default:
        return "see ya!";
    }
  }
}
