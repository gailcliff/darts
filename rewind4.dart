library re1;

import 'rewind3.dart';

part 'rewind10.dart';

void testLib() {
  print("testing lib...");
}

class User {
  final int _id;
  final String _name;
  final bool _onTrial;

  const User(this._id, this._name, [this._onTrial=false]);

  const User.Default(): this(-1, "John Doe");

  const User.Trial(int id, String name): this(id, name, true);

  factory User.fromMap(Map<String, Object> data) {
    return User(data['id'] as int, data['name'] as String);
  }

  bool get isOnTrial => _onTrial;

  get foo => 89 * 34;

  @override
  String toString() {
    return("User(id: $_id, name: $_name)");
  }

  void bar() {
    print("chaz");
  }
}

void main() {
  User user9 = User.fromMap({'id': 843, 'name': "Dowillis"});

  final User user1 = User.Default();
  User user2 = const User.Default();
  User user3 = const User.Default();
  User user4 = const User(-1, "John Doe");
  User user5 = const User.Trial(34, "Free trial");
  User user6 = const User(41, "Wu");
  User user7 = const User(41, "Wu");
  User user8 = const User(203, "ifoasdf");

  User user10 = user9;

  print(user1.hashCode);
  print(user2.hashCode);
  print(user3.hashCode);
  print(user4.hashCode);
  print(user9.hashCode);
  print(user10.hashCode);

  print(user5.isOnTrial);
  print(user7.isOnTrial);
  print(user8.foo);


  Person person = Person(firstName: "cliff", lastName: "man");
  print(person.name);
  person.name = "Martin Shikuku";
  print(person.name);

  Connection conn = Connection.connection();
  Connection conn2 = Connection();

  print("Conn1 hashCode: ${conn.hashCode}");
  print("Conn2 hashCode: ${conn2.hashCode}");

  String? str;

  print("String length: ${str?.length}");

  Person? person1;// = Person();

  person1
    ?..firstName = "Cliff"
    ..lastName = "Odhis";

  print(person1);

  List<int>? lst;
  print(lst?[4]);

  print(lst is int);
  print(lst is! int);

  Bottle bottle = Bottle();
  bottle.open();

  Bottle bottle1 = SodaBottle();
  bottle1.open();

  SodaBottle bottle2 = SodaBottle();
  bottle2.open();
}

class TextWidget {
  String? text;
  late final int? foo = text?.length;

  bool isLong() {
    if (text == null) {
      return false;
    }
    return text!.length > 100; // error
  }
}

abstract class DatabaseRepository {

  int? sessionId;

  factory DatabaseRepository() => _DatabaseAccessor();

  void add(Object item);

  Object? fetch(int itemId);

  void update(int id) {}

  void delete(int id);
}



class _DatabaseAccessor implements DatabaseRepository {
  @override
  void add(Object item) {
    print("adding...");
  }

  @override
  void delete(int id) {
    print("deleted $id");
  }

  @override
  Object? fetch(int itemId) => itemId;

  @override
  void update(int id) {
    print("updated $id");
  }

  @override
  int? sessionId=  90;

}

abstract class Bottle {

  factory Bottle() => SodaBottle();

  void open();
}

class SodaBottle implements Bottle {

  @override
  void open() {
    print("Fizz fizz");
  }
}
