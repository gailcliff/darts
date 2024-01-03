import 'dart:html';
import 'dart:math' as MATH;

import 'foo.dart';

enum Car {
  Pagani,
  FERRARI,
  KOENIGSEGG,
  Tesla,
  Bugatti,
  Rimac,
}

void main (List<String> args) {
  //single line comment

  /*
  * this is
  * a
  * multi-line comment
  * */

  /**
   * this is
   * a
   * documentation comment
   * */
  print(MATH.sin((45 * MATH.pi) / 180));
  print(1 / MATH.sqrt(2));

  print(3.26.roundToDouble());
  print(3.56.ceil());
  print(3.isOdd);


  const String name = "Clifford Gail Odhiambo";
  final extraName = "nyanga";
  const int age = 20;
  const bool cuffed = false;

  final date = DateTime.now();


  //-----------------
  print('\n\n-----------------\n\n');


  num x = 0;
  print(x.runtimeType);
  var y = x;

  //print(y.runtimeType);

  String c = 'ly =';
  print(c.length);


  //-----------------
  print('\n\n-----------------\n\n');

  var foo = """
  my name is
  clifford
  gail
  odhiambo
  """;

  var bar = 'my name is\n'
  'clifford\n'
  'gail\n'
  'odhiambo $extraName';

  print(foo);
  print(bar);
  print('I luv \u{1F3AF}');


  Object? jar = null;
  //jar = true;

  const number = 10;
  const multiplier = 5;
  final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  print(summary);


  //-----------------
  print('\n\n-----------------\n\n');
  String fasd = "fds";

  switch(fasd) {
    case 'abc': print("1"); break;
    case 'fs': print("2"); break;
    case 'her': print("3"); break;
    default: print("4");
  }

  //-----------------
  print('\n\n-----------------\n\n');

  var favoriteCar = Car.Rimac;
  print(favoriteCar.index);

  switch (favoriteCar) {
    case Car.FERRARI:
      print("People pleaser");
      break;
    case Car.KOENIGSEGG:
      print("My favorite Car!");
      break;
    case Car.Pagani:
      print("My second favorite Car!");
      break;
    case Car.Tesla:
      print("I hate petrol.");
      break;
    case Car.Bugatti:
      print("I would take a bitch on a date with this..");
      break;
    case Car.Rimac:
      print("It will be my favorite if they make Bugatti Rimac");
      break;
  }


  //-----------------
  print('\n\n-----------------\n\n');


  final rand = new MATH.Random();

  while (true) {
    int num = rand.nextInt(6);
    if(num == 5) {
      print("found a 5\n\n"); break;
    } else print(num);
  }

  String str = "I ❤ Dart";

  for(var char in str.runes) {
    print(String.fromCharCode(char));
  }

  Car.values.forEach((car) => (car == Car.KOENIGSEGG ? print("$car is my favorite car!") : print(car)));

  var nums = [1,2,3,4,5,6,7,8,9,10,134,254,423,89898,123,8987654];
  nums.forEach((element) {
    print("Square of $element is ${MATH.pow(element, 2)}");
  });

  var sum = 0;
  for (var i = 0; i < 5; i++) {
    // sum += i;
    print("Num is $i");
  }

  print(getFullName("cliff", null));
  print(getUser("nyanga",email: '94@54.com'));
  print(getUser("", email: "fkcsj@438.c"));
  print(getUsername(fname: null));
  print(getFullname());
  print(getPassword("foo", dob: 150921));

  var t = applyMultiplier(8);
  print(t(7));
}
String getFullName (String fname, String? lname, [String? mname]) {
  return mname != null ? "$fname $mname $lname" : "$fname $lname";
}

Function getFullname = () {

};
String? getUsername ({required String? fname}) {
  return fname;
}

String getUser (String fname, {String? lname, required String email}) {
  return "$fname $lname ($email) is a certified user";
}
String getPassword(String userName, {int? dob, String? email}) {
  return MATH.Random().nextInt(100000).toString();
}
Function applyMultiplier(num multiplier) {
  return (num value)  {
    print(null);
    value * multiplier;
  };
}