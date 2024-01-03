library be1;
import 'dart:math' as math;

import 'rewind6.dart';


void main() {
  print("This time we're hitting the bull's eye");

  final date = DateTime.now();
  print(date);
  print(DateTime.now().millisecondsSinceEpoch);

  const myPie = math.pi;

  int a = 6, b = 11, c = -35;

  double sqrtPart = math.sqrt(math.pow(b, 2) - (4 * a * c));
  num twoTimesA = 2 * a;

  double quadr1 = (-b + sqrtPart) / twoTimesA;
  double quadr2 = (-b -sqrtPart) / (twoTimesA);

  print(quadr1);
  print(quadr2);

  var k = 8;
  print(k.runtimeType);
  double m = k.toDouble();
  m.toDouble();

  num j = 8;
  j.isNegative;
  print(j.runtimeType);
  print(j as int);

  String s = "she sells sea shells at the sea shore";
  final codeUnits = s.codeUnits;

  StringBuffer t = StringBuffer();

  for(int f = 0; f < codeUnits.length; f++) {
    t.write(String.fromCharCode(codeUnits[f]));
  }

  String v = t.toString().toUpperCase();
  print(v);

  String z = "don't do that";

  num u = 10;
  // int w = u;

  int r = 58;
  num x = r;

  print(x.runtimeType);
  print(x is int);
  print(r is num);

  Animal animal = Dog();
  Animal animal1 = Animal();
  Dog dog = Dog();

  print(dog is Animal);
  print(animal is Dog);
  print(animal1 is Dog);

  print(dog.runtimeType);
  print(animal.runtimeType);
  print(animal1.runtimeType);

  // print(instanceof(animal, Dog));

  final g = animal as Dog;
  g.foo();
  // print(g);
  // print(h);
  animal.foo();
}

class Animal {}
class Dog extends Animal{
  String name = "dogg";

  void foo(){
    printToUpperCase("text");
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$name$name";
  }
}