void main () {
  print("Before counter");
  counter();
  print("After initializing counter");

  Foo foo = new Foo();
  print(foo.jar());
}

Future<void> counter () async {
  print("Before try-catch block");
  try {
    final foo = await Future<int>.delayed(Duration(milliseconds: 10), () {
      int c;
      for (c = 0; c < 40000; c++) {
        if(c > 20000) throw Exception("ERRR!");
        print("C is: $c");
      }
      return c;
    });
    print("Value: $foo");
  } catch (e) {
    print("Caught an exception: $e");
  } finally {
    print("Finished execution");
  }
  print("After try-catch block");
}

abstract class Foo {
  void foo();

  int bar();

  String jar();

  void far();

  factory Foo() => Test._();
}

class Test implements Foo {

  Test._();

  @override
  int bar() => 0;

  @override
  void far() {
    // TODO: implement far
  }

  @override
  void foo() {
    // TODO: implement foo
  }

  @override
  String jar() => "test";
}