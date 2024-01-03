library re1;
import 'dart:math' as math;
// import 'package:http/http.dart';

import 'foo.dart';

part 'rewind10.dart';

const limit = 10;

void testLib() {
  print("testing lib...");
}

/**
 * This is a documentation comment
 * */
void main(List<String> args) {

  /// this is also a documentation
  /// comment. knahmsaying!!
  // regular comment

  Sphere sphere = new Sphere2(34);
  print(sphere.toString());
  Sphere2 sphere2 = sphere as Sphere2;
  print(sphere2.toString());

  print(args);
  print(limit);
  print(31.456.round());
  print(69.isOdd);

  final currentTime = DateTime.now();
  print(currentTime);

  print(currentTime.runtimeType);
  print("" is double);

  double j = 90.43;
  print(j.floor());

  print(math.sin(math.pi/2));

  print(9~/2);


  var bar;
  bar = 9;
  int m;

  num myNum = 90;
  myNum = 94.23;
  7.toDouble();
  6.toInt();


  final  foo = 56.toDouble();

  print(myNum.runtimeType);

  print("Sin of 30 degrees is:\t${math.sin(math.pi/6)}");

  var str = '''She sells sea shells \
      at the 
      sea shore.''';
  String s = "4.5fs";
  print(s.length);
  double? b = double.tryParse(s);
  print(b);
  print(str);
}

void foo(var bar) {
  bar = "fadsf";
  print(bar);
}

enum Cars {
  SEDAN,
  SUV,
  SUPERCAR,
  CABRIOLET,
  HATCHBACK,
  BRONCO,
}

void main1 () {

  var car = Cars.CABRIOLET;
  print(car);
  print(car.index);
  print(car.runtimeType);

  switch(car) {
    case Cars.SEDAN:
      print("Family");
      break;
    case Cars.SUV:
      print("Boss");
      break;
    case Cars.SUPERCAR:
      print("Fast");
      break;
    case Cars.CABRIOLET:
      print("Clout chaser");
      break;
    case Cars.HATCHBACK:
    case Cars.BRONCO:
      print("Lame");
      break;
  }

  var rand = new math.Random();

  while(rand.nextInt(10) != 4) {
    print("Try again!");
  }
  print("You won!");

  const names = ["Clifford", "Gail", "Odhiambo", "Nyanga"];
  names.forEach((element) => print("Name: $element"));

  // greet(greeting);

  var powerFn = power(2);
  print(powerFn(2));
  print(powerFn(3));
  print(powerFn(5));
  print(powerFn(7));
  print(powerFn(11));

  const people = ['Chris', 'Tiffani', 'Pablo'];
  people.forEach((element) {
    print("$element you suck");
  });

  // Person person = Person(firstName: "Cliff", lastName: "G");

}

// Function greeting =  (String name, {required String? lastName, String title="Mr"}) {
//   return "Morning $title. $name $lastName";
// };
//
// void greet(Function greeting) {
//   print(greeting("Gail", _lastName: "Cliff"));
// }

Function power (int exponent) {
  [].forEach((element) { });
  return (int number) => math.pow(number, exponent);
}
