abstract class DatabaseRepo {
  int get conn;

  void closeConn ();

  List<String> get tables;

  void deleteTable (String tableName);

  DatabaseRepo();

  factory DatabaseRepo.Db() => new _DbAccessor();

  factory DatabaseRepo.File() => new _FileAccessor();
}

abstract class FileRepo {
  void foo();
}

class Accessor implements DatabaseRepo, FileRepo {
  @override
  void closeConn() {
    // TODO: implement closeConn
  }

  @override
  // TODO: implement conn
  int get conn => throw UnimplementedError();

  @override
  void deleteTable(String tableName) {
    // TODO: implement deleteTable
  }

  @override
  // TODO: implement tables
  List<String> get tables => throw UnimplementedError();

  @override
  void foo() {
    // TODO: implement foo
  }
}

class _DbAccessor implements DatabaseRepo {
  @override
  void closeConn() { }

  @override
  int get conn {
    return 895493;
  }

  @override
  void deleteTable(String tableName) { print("Deleted table: $tableName"); }

  @override
  List<String> get tables => ['table1'];
}

class _FileAccessor implements DatabaseRepo {

  @override
  void closeConn() { }

  @override
  int get conn => 64368;

  @override
  void deleteTable(String fileName) { print("Deleted file: $fileName"); }

  @override
  List<String> get tables => ['file1'];
}
mixin Adder {
  void printSum(int a, int b) => print(a+b);
}

abstract class Calculator implements Comparable {

  @override
  int compareTo(other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }
}


void main () {
  FileRepo repo = new Accessor();
  DatabaseRepo repo1 = new Accessor();

  print(repo.runtimeType);
  print(repo1.runtimeType);
}