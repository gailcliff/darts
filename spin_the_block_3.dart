bool? isBeautiful(String? item) {
  if (item == 'flower') {
    return true;
  } else if (item == 'garbage') {
    return false;
  }
  return null;
}

void main () {
  var months = <String>['january', 'feb', 'mar', 'apr', 'may', 'jun', 'july', 'august',
  'sept', 'oct', 'nov', 'dec'];

  var MONTHS = [for(String month in months) month.toUpperCase()];

  print(MONTHS);
  print(MONTHS.length);
  const c = <String>[];

  final Map names = {
    "first name": "clifford",
    "middle name": "gail",
    "last name": "odhiambo",
  };
  print(names.containsKey("firstk_name"));
  print(names);
  names['last name'] = 'odhis';
  print(names.keys);
  print(names.values);

  names.forEach((key, value) => print("$key is $value"));

  for (var entry in names.entries) {
    print("${entry.key} is: ${entry.value}");
  }
  print("\n\n------------------------\n\n");

  var nums = <int>[5,6,7,8,9,10,20,30,40,50];
  var nums1 = nums.where((element) => (element > 10));
  var nums2 = nums.reduce((value, element) => value + element);
  var nums3 = nums.fold(10,
          (int previousValue, element) => (element + previousValue));
  var nums4 = nums.reversed;


  print(nums1);
  print(nums2);
  print(nums3);
  print(nums4);
  nums4.toList().sort((int a,b) => b.compareTo(a));
  print(nums4);

  String text = "my name is clifford gail";
  var chars = <String>{};


  for(var codeUnit in text.codeUnits) {
    chars.add(String.fromCharCode(codeUnit));
  }
  print(chars);

  List<User> users = [User(1,'cliff'), User(2, 'gail'), User(3, 'odhis')];
  List<Map> userListMap = users.map((e) => {"id": e.id, "name": e.name}).toList();

  var ints = [3,4,5];
  var ints2 = [for(int c in ints) c * c];

  print(ints2);

  print(userListMap);

  print(names);


}
class User {
  int id;
  String name;

  User(this.id, this.name);
}