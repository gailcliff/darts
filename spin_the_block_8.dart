library spin_the_block_8;
import 'dart:math' show pi, sqrt;

part 'spin_the_block_9.dart';

enum Foo {
  BAR
}
void main() {
  CountDown c = new CountDown(300, onCountDown: (int value) {
    print("Counted down: $value");
  });
  c.countDown();
  var b = sqrt(4);
  var d = pi;

  print(Foo.BAR.toString());
}

class CountDown {
  int value;
  Function(int c)? _onCountDown;

  CountDown(int value, {Function(int c)? onCountDown}) : this.value = value, this._onCountDown = onCountDown {

  }

  void countDown () {
    for(int c = this.value; c > 0; c--) {
      if(_onCountDown != null) _onCountDown?.call(c);
    }
  }
}