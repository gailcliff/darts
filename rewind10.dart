part of re1;

void mamin () {

  testLib();

  final List<Person> persons = List.unmodifiable([
    Person("cliff", "g"),
    Person("odhiambo", 'nyanga')
  ]);

  print(persons);
  persons[0] = Person("","");

  persons[0].lname = "Gail";

  print(persons);
}

class Person {
  String fname;
  String lname;

  Person(this.fname, this.lname);

  @override
  String toString() {
    // TODO: implement toString
    return "$fname $lname";
  }
}