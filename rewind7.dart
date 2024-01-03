
Future<void> main() async{

  print("Before declaring future 1");

  Future<int>.delayed(
      Duration(seconds: 2),
      ()=> throw Exception("Err!")
      // DateTime.now().millisecondsSinceEpoch
  )
  .then((int result) => print("Future 1 resulted in: $result"))
  .catchError((error) => print("An error occurred in future 1: $error"))
  .whenComplete(() => print("Future 1 completed"));

  print("After declaring future 1");


  print("Before declaring future 2");

  try {
    int result = await Future<int>.delayed(
        Duration(seconds: 5),
        () => throw Exception("Err!")
        // DateTime.now().millisecondsSinceEpoch
    );
    print("Future 2 resulted in: $result");
  }
  catch(error) {
    print("An error occurred in future 2: $error");
  }
  finally {
    print("Future 2 completed");
  }

  print("After declaring future 2");
}
