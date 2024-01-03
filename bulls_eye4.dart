import 'dart:math';

List<String> foo=[];

void main() {
  var names = <String>[
    "Clifford", "Gail", "Odhiambo", "Nyanga"
  ];

  print(names);

  print(names.first);
  print(names.last);

  print(foo.isEmpty);
  print(names.isEmpty);

  void printToUpperCase(String item) => print(item.toUpperCase());

  names.forEach(printToUpperCase);

  final mainNames = ['Gail', 'Cliff'];
  final otherNames = ['Odhis', 'Nyanga'];

  final allNames = [...mainNames, ...otherNames];
  final filteredNames = [
    if(mainNames[0].startsWith("G")) mainNames[0].toUpperCase(),
    for(String otherName in otherNames) otherName.toLowerCase()
  ];
  print(filteredNames);
  print(allNames);

  List<String> myList = ["extra","ordinary",'!',];
  final goals = [
    "I", "want", "to", "be","I", "want", "to", "be",
    for(String goal in myList) goal.toUpperCase()
  ];

  final solidified = StringBuffer();
  solidified.writeAll(goals, ' ');
  print(solidified.toString());

  print(goals);
  print(goals.toSet());

  final goalSet = Set.from(goals);
  print(goalSet);


  final myNames = <String, String>{
    "first_name": "Cliff",
    "last_name": "G"
  };

  print(myNames);
  print(myNames.keys);
  print(myNames.values);
  print(myNames.containsKey("last_name"));

  print(myNames.entries);

  String? lname = myNames['lname'];
  print(lname);

  // myNames.remove("last_name");
  print(myNames);

  var printNameDict = (String key, String value) => print("$key => $value");
  myNames.forEach(printNameDict);

  for(var entry in myNames.entries) {
    print(entry.key + entry.value);
  }

  final gNames = names.where((name) => name.toUpperCase().startsWith('G'));
  print(gNames);
  print(names.map((e) => e.toUpperCase()));

  // names = [];
  final concatenated = names.fold('', (String value, String element) => value + ' ' + element);
  print(concatenated);

  var ascendingOrder = (String s1, String s2) => s1.compareTo(s2);
  var descendingOrder = (String s1, String s2) => s2.compareTo(s1);

  Random rand = Random(5);

  names.shuffle(rand);
  print(names);
  names.sort(ascendingOrder);
  print(names);
  names.shuffle(rand);
  print(names);
  names.sort(descendingOrder);
  print(names);

  print(names.reversed);

  final fltrd = names
  .where((element) => element.length > 4)
  .map((e) => e.toUpperCase());

  var srtd = fltrd.toList();
  srtd.sort(ascendingOrder);
  print(srtd);

}