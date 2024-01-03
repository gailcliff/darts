library rewind3;

import 'dart:math' as math hide pi;

// import 'package:http/http.dart';

part 'rewind2.dart';

void main () {
  const lim = 154.6585;
  final date = DateTime.now();

  print(lim.truncate());
  print(lim.toInt());

  print(date.runtimeType);
  print(date is bool);


  final sb = StringBuffer();
  sb.write("Clifford");
  sb.writeln("Gail");
  sb.writeln("Odhiambo");

  String name = "Cliff";
  String lname = "G";
  print("Hello ${name} ${lname}!");

  int? c = int.tryParse("fjlsf");
  double b = double.parse("8.3");

  print(c);
  print(b);

  print(sb);
  print(sb.length);
  print("str".length == "");

  Foo foo = Foo();
  print(foo);

  Person p = Person.temp();
  print(p);

  final myWealth = Wealth.UNLIMITED_MONEY;
  print("idx: ${myWealth.index}");

  final rand = new math.Random();
  print(rand.nextDouble());

  final ints = [5,34,543];

  ints.forEach((element) => print(element * element));

  print(getBar(param: "that's a barr!"));

  final greeting = eventGreeting("Adios");
  greet(greeting);

  var sq = (int c) => c * c;
  print(sq(9));

  Person personB = Person()
  ..firstName = "Cliff"
  ..lastName = "G";

  print(personB);
}

void greet (Function greeting) {
  greeting.call();
}

enum Wealth {
  POOR,
  RICH,
  SUPERRICH,
  WEALTHY,
  OPULENT,
  UNLIMITED_MONEY
}

String? getBar({required String param}) {
  return param;
}

Function eventGreeting (String greeting) {
  return ([String? name='John Doe']) {
    print("$greeting, $name!");
  };
}