// library be1;
import 'dart:convert';

import 'spin_the_block_2.dart';

class User {
  final String firstName, lastName, _email, _dob;

  const User (var firstName, String lastName, String email, String dob) :
       assert(firstName != null),
       this.firstName = firstName,
       this.lastName = lastName,
       this._email = email,
       this._dob = dob;


  void printUser() {
    print(toString());
  }

  @override
  String toString() {

    return
      """{
    \"fname\": $firstName,
    \"lname\": $lastName,
    \"email\": $_email,
    \"dob\": $_dob
}""";
  }
}

void main () {

  Database database = new Database();
  print(database.hashCode);

  Database db2 = new Database();
  print(db2.hashCode);

  Database db3 = new Database();
  print(db3.hashCode);

  Database db4 = Database.getDb();
  print(db4.hashCode);

  Sphere sphere = const Sphere(radius: 12);
  sphere = new Sphere(radius: 2);
  print(sphere.volume);
  print(sphere.surfaceArea);
}

class Sphere {
  final int radius;
  static const pi = 3.142;

  const Sphere({required this.radius});

  factory Sphere.Foo () => Sphere(radius: 4);

  double get volume => (4/3 * pi * (radius * radius * radius));

  double get surfaceArea => (4 * pi * (radius * radius));

  @override
  String toString() {
    // TODO: implement toString
    return radius.toString();
  }
}

class Sphere2 extends Sphere {
  Sphere2(int radius): super(radius: radius);
}
