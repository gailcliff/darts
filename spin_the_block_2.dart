import 'dart:math';

import 'foo.dart';

void main () {
  //
  // User user = new User("Cliff", "G", "cliff@g.g", "10 Apr 1999");
  // user.printUser();
  //
  // Database db = Database._();
  // print(db.hashCode);
  //
  // Database db1 = new Database();
  // print(db1.hashCode);
  //
  // Database db2 = Database.getDb();
  // print(db2.hashCode);


  Test test = new Test(9, "foasd");
  print(test.name);
}

class Test {
  int _id;
  String _name;


  Test(this._id, this._name);

  //getters
  int get id => this._id;
  String get name {
    print("Calculating...");
    int c = 6 * 6 ;
    print("Answer: $c");
    return this._name;
  }

  //setters
  set id(int id) => this._id = id;
  set name(String name) => {
    if(name == "") this._name = name
    else name = ""
  };

  static int testNumber = 0;

  static void printTestNo () {
    print("Test no: $testNumber");
  }

  int get test_no => testNumber;
  set test_no(int test_no) => testNumber = test_no;

  @override
  String toString() {
    print("it is: $testNumber");
    // TODO: implement toString

    return "Test: $id, $name";
  }
}

class Database {
  Database._();

  static final Database _database = new Database._();

  static Database getDb () => _database;

  factory Database () => _database;
}
