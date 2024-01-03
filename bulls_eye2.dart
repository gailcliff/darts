// library bulls_eye;

import 'dart:math' as math;
import 'bulls_eye1.dart' as be1 show Dog;
import 'bulls_eye3.dart' as be3 show User;


void main() {
  String firstName = 'cliff', lastName = 'gail';
  String userName = "${firstName}_$lastName";

  print(userName);

  int c = int.parse("544");
  print(c);

  bool j = bool.parse('TRue', caseSensitive: false);
  print(j);

  print(userName.length);
  print(!j);

  print(firstName == 'Cliff');
  print(lastName.compareTo(firstName));

  int k = 100;

  if(k < 10) {
    print("Below par");
  } else if (k > 10) {
    print("Above par");
  } else {
    print("At par");
  }

  k > 10 ? print("Above") : (k < 10 ? print("Below") : print("At"));

  switch(k) {
    case 10:
      print("ayee");
      break;
    default:
      print("awoo");
      break;

  }

  final h = be1.Dog();
  h.foo();
  print("Dog: $h");

  Weather w = Weather.RAINY;
  print(w.index);
  print(w.name);

  switch(w) {

    case Weather.RAINY:
      // TODO: Handle this case.
    print('rainyy');
      break;
    case Weather.SUNNY:
      // TODO: Handle this case.
      print('sunnyy');
      break;
    case Weather.WINDY:
      // TODO: Handle this case.
      print('windyy');
      break;
    case Weather.CLOUDY:
      // TODO: Handle this case.
      print('cloudyy');
      break;
  }

  for(int i = 0; i < 99; i++) {
    print(math.pow(i, i));
  }

  final myRand = math.Random();
  int randInt = myRand.nextInt(9999);
  bool randBool = myRand.nextBool();
  bool randBool1 = myRand.nextBool();
  bool randBool2 = myRand.nextBool();
  double randDouble = myRand.nextDouble();

  print("******");
  print(randInt);
  print(randBool);
  print(randBool1);
  print(randBool2);
  print(randDouble);


  final myArr = [4,7,45];
  for(var a in myArr) {
    print("$a in intArr");
  }

  myArr.forEach((element) => print("$element for each in $myArr"));

  print("---------------------");

  print(getUserName("gail", null));
  print(getUserNameOptional("gail",));
  print(getParsedInt('869'));
  print(getUserNameKw('cliff', lName: 'gail'));


  final usr =  be3.User("Mar", trialTime: 45);
  print(usr);

  final lst = const ["test list"];
  print(lst);
  lst.add("another test");
  print(lst);
}

enum Weather {
  RAINY, SUNNY, WINDY, CLOUDY
}

String getUserName(String fName, String? lName) => lName == null ? fName : "${fName}_$lName";

String getUserNameOptional(String fName, [String? lName='doe']) {
  return lName == null ? fName : "${fName}_$lName";
}

String getUserNameKw(String fname, {required String lName, String? otherName='doe'}) {
  return "${fname}_$lName:$otherName";
}

int? getParsedInt(String toParse) {
  return int.tryParse(toParse);
}


