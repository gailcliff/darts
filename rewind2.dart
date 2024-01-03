part of 'rewind3.dart';

class Person {
  String firstName;
  String lastName;
  String _name = '';

   Person({String firstName = "John", String lastName = 'Doe'}) :
      this.firstName = firstName,
      this.lastName = lastName;

   String get name => _name;
   void set name(String name) => _name = name;

  @override
  String toString() {
    return "Person(firstName: $firstName, lastName: $lastName)";
  }

   Person.temp() : this();
}

class Foo {
  @override
  String toString() {
    return "this is a foo";
  }
}

void mainman () {
  final foo= Person.temp();
  final person = Person(firstName: "foo", lastName: "G");

  print("${person.lastName}, ${person.firstName}");
  // person._lastName = "Gail";
  print("${person.lastName}, ${person.firstName}");

  print(person);
  print(person.toString());

  Person personA = Person();
  Person personB = Person.temp();

  print(personA);
  print(personB);

}

class Connection {
  const Connection._();

  static const Connection _connection = Connection._();

  factory Connection() => _connection;

  static Connection connection () => _connection;
}