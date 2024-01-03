
import 'dart:developer';
import 'dart:isolate';

void isolated_count(SendPort sendPort, {int c = 0, String j = ''}) {
  int c = 0;
  for(c = 0; c < 1000; c++) {
    print("isolated: $c");
  }
  sendPort.send(c);
}