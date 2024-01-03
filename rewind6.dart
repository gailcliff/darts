import 'dart:math' as math;

Function power (int exponent) {
  return (int number) {
    return math.pow(number, exponent);
  };
}

void main1(){
  var powerFn = power(2);
  // print(powerFn(2));
  // print(powerFn(3));
  // print(powerFn(5));
  // print(powerFn.call(89));


  bool ambitious = true;

  List<String> myList = ["extra","ordinary",'!',];
  final goals = [
    "I", "want", "to", "be","I", "want", "to", "be",
    for(String goal in myList) goal
  ];

  goals.forEach(printToUpperCase);

  // final list2 = goals.toSet();
  // final anotherSet = {1, 2, 3, 1};
  //
  // print(anotherSet);
  // anotherSet.add(42);
  // anotherSet.add(2112);
  // anotherSet.add(42);
  // print(anotherSet);
  //
  // print(goals);

  final myMap = <String, String>{
    "first_name": "Clifford",
    "last_name": "Odhiambo",
  };
  myMap["middle_name"] = "Gail";

  print(myMap);

  print(myMap.length);

  String? middleName = myMap['middle_name'];
  print(middleName);

  var removed = myMap.remove(null);
  print(removed);
  print(myMap);

  final keys = myMap.keys;
  final vals = myMap.values;

  for(String key in keys) {
    print(key);
  }
  vals.forEach(print);

  print(myMap.containsKey("first_name"));
  print(myMap.containsValue("Gail"));

  print("----------------------------------");

  for(String key in myMap.keys) {
    print("$key - ${myMap[key]}");
  }
  print("**********");
  myMap.forEach((key, value) => print("$key: $value"));
  print("**********");
  myMap.forEach(printEntry);
  print("**********");

  for(var entry in myMap.entries) {
    print("${entry.key} => ${entry.value}");
  }
}

void main() {
  final myInts = [2,3,4,5,7,10,11,13,14,17,19];

  // final mapped = myInts.map((int num) => num * num);
  final mapped = myInts.map(square);

  final filtered = myInts.where(isOdd);
  final filtered1 = myInts.where((int item) => item.isEven);

  final reduced = myInts.reduce((int previous, int item) => previous + item);

  final folded = myInts.fold(29, (int previousValue, int element) => previousValue + element);

  int sum = 0;
  myInts.forEach((element) => sum += element);

  print(myInts);
  print(filtered.toList());
  print(filtered1.toList());

  print(reduced);
  print(sum);

  print(folded);

  myInts.shuffle();

  print(myInts);

  myInts.sort();
  print(myInts);

  myInts.shuffle();
  print(myInts);

  final inReversedOrder = myInts.reversed;
  print(inReversedOrder);

  print(myInts);

  myInts.sort((int num1, int num2) => num1.compareTo(num2));
  print(myInts);

  final myWords = [
    "sign",
    "closed",
    "father",
    "approach",
    "skate",
    "rhetoric",
    "tragedy",
    "sell",
    "empire",
    "folk"
  ];

  print(myWords);
  myWords.sort(ascending);
  myWords.sort((String str1, String str2) => str1.compareTo(str2));
  print(myWords);
  myWords.shuffle();
  myWords.sort(descending);
  myWords.sort((String str1, String str2) => str2.compareTo(str1));
  print(myWords);

  final chained = myWords.where((String word) => word.length <= 4).map((e) => e.toUpperCase());
  print(chained);

  User user1 = User("Gail", 49478);
  User user2 = User("Cliff", 193935);
  User user3 = User("Odhiambo", 688284);

  final users = <User>[user1, user2, user3];

  final mapped1 = users.map((user) => {user.id: user.name});
  print(mapped1);
}

int ascending(String str1, String str2) => str1.compareTo(str2);
int descending(String str1, String str2) => str2.compareTo(str1);

int square(int num) => num * num;

bool isOdd(int num) => num.isOdd;
bool isEven(int num) => num.isEven;

void printToUpperCase(text) {
  print(text.toUpperCase());
}

void printEntry(String key, String value) {
  print("$key -> $value");
}
class Foo {
  int bar;

  Foo(int bar) : this.bar = bar;
}

class User {
  String name;
  int id;

  User(this.name, this.id);
}