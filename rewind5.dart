import 'dart:math';

import 'rewind4.dart' show DatabaseRepository;

enum Grade {
  A, B, C, D, E, F, G, X,
}

class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  Person.temp() : this("John", "Doe");


  String get fullName => "$firstName $lastName";

  @override
  String toString() => fullName;
}

class Student extends Person {

  final List<String> grades;

  Student(String firstName, String lastName) : grades = <String>[], super(firstName, lastName);

  @override
  String get fullName => "${super.lastName}, ${super.firstName}";

  void grade(Grade grade) {
    grades.add(grade.name);
  }

  @override
  String toString() => super.fullName + ": " + grades.toString();
}

abstract class Animal {
  String name;
  bool alive = true;

  Animal(this.name);

  void eat();
  void move();

  void die () {
    alive = false;
  }

  @override
  String toString() => "$name is a $runtimeType";
}

class Dog extends Animal with Muncher {

  Dog(String name): super(name);

  @override
  void move() {
    print("Dash dash");
  }
}

class Whale extends Animal with Swimmer, Muncher {

  Whale(String name) : super(name);

  @override
  void eat() {
    print("Swallow!");
  }

  void ventilate () {
    print("Shooting water");
  }
}

class Shark extends Animal with Swimmer, Muncher {

  Shark(String name) : super(name);
}

mixin Swimmer {
  void move() {
    print("Swim swim!");
  }
}

mixin Muncher {

  void eat() {
    print("Munch munch!");
  }
}

void main() {
  final repo = DatabaseRepository();
  repo.add("item");
  print(repo.fetch(59));
  repo.update(23);
  repo.delete(44);

  Whale wheelie = Whale("Wheelie");
  wheelie.move();
  wheelie.eat();

  Shark ninja = Shark("Ninja");
  ninja.eat();

  final calc = Calculator();
  int c = calc.add(5, 91);
  print(c);

}

class Calculator with Adder {

}
mixin Adder {
  int add(int a, int b) => a+b;
}