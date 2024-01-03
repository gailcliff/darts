
Future<void> main() async{

  int c = await k();
  Increment increment = Increment(0, 400, onIncrement: print);
  increment.increment();
}

Future<int> k() async {
  return 1;
}
class Increment {
  int initial;
  int max;
  void Function(int val)? onIncrement;

  Increment(this.initial, this.max, {this.onIncrement});

  void increment() {
    for(; initial <= max; initial++) {
      onIncrement?.call(initial);
    }

    Future((){}).then((result){}).catchError((error){}).whenComplete(() => null);
  }
}