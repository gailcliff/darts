import 'dart:math' as math;

void main() {

  print("Before future events");

  Future<String>(
      () {
        // throw Exception('stub!');
        return "john_doe";
      }
  ).then((String value) => print(value.toUpperCase()))
      .whenComplete(() => print("computation complete"))
      .catchError((err) {print("an error occurred: ${err}");});

  Future<String>(
          () {
        // throw Exception('stub!');
        return "don_joe";
      }
  ).then((String value) => print(value.toUpperCase()))
      .whenComplete(() => print("computation completee"))
      .catchError((err) {print("an error occurredd: ${err}");});

  print("After future events");

  var c = Future<num>.value(longComp());
  print("future val: $c");
  longComp().then((value) => print("result of long computation: $value"));
}

Future<num> longComp() async {
  num result = -1;
  try {
    result = await Future<num>.delayed(
        Duration(seconds: 5), () {
      throw Exception("im just being difficult");
      return math.pow(9, 5);
    });
  } catch (e) {
    print(e);
    print(e.runtimeType);
  } finally {
    print(result.runtimeType);
    return result;
  }
}