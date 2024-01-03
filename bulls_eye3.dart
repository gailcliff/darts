
void main() {
  var j = (int c){
    return c*c*c;
  }(10);

  print(j);

  var salamu = greet('Good morning');
  // salamu.call(name: "Cliff G");
  // salamu(name: "Cliff G");
  salimu(salamu, "G");

  var funVar = greet;
  funVar('Bonjour').call(name: 'Francois');

  var yo = helloWorld;
  yo();
  yo.call();

  User user = User("Ayee", lastName: "Awoo");
  // ..firstName = 'G'
  // ..lastName = 'C';
  print(user);

  User user1 = User.Trial(trialTime: 60);
  User user2 = User.Foo();

  print(user1);
  print(user2);
  // print(User.SPECIES);
  print(user1._trialTime);

  User.getSpecies();

  User user3 = User.Foo();
  User user4 = User.Foo();

  print("HASHCODES: user3=${user3.hashCode}, user4=${user4.hashCode}");

   User user5 = User("Trier");
  User user6 =  User("Trier");
  print(user5.hashCode);
  print(user6.hashCode);

  print(user5 == user6);

  user6 = user5;
  user6.otherName = "Clifford";
  user6.otherName = "Gail";
  user6.otherName = "Odhiambo";
  user6.otherName = "Nyanga";

  print(user5);
  print(user6);
  print(user5.otherNames);


  User user7 = User.fromJson({
    "first_name": "Odhis",
    "last_name": "Nyanga"
  });
  print(user7);

  final key = PrivateKey.getPk();
  final key2 = PrivateKey();
  final key3 = PrivateKey.getPk();
  final key4 = PrivateKey();
  final key5 = PrivateKey();

  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^");
  print(key.hashCode);
  print(key2.hashCode);
  print(key3.hashCode);
  print(key4.hashCode);
  print(key5.hashCode);
  print(key2.pw);
  print(key5.pw);
}

void helloWorld() {
  print("Hola, world!");
}

Function greet(String greeting) => ({required String name}) => print("$greeting, $name");

void salimu(Function greetingFn, [String name='John Doe']) {
  greetingFn.call(name: name);
}


class User {
  static const String SPECIES = 'human';

  final String firstName, lastName;
  final int? _trialTime;
  final List<String> names;

  User(this.firstName, {this.lastName='Doe', int? trialTime}) : this._trialTime = trialTime, this.names=[];

  User.Trial({required int trialTime}) : this("John", trialTime: trialTime);

  User.Foo() : this("Foo", lastName: "Bar");

  factory User.fromJson(Map<String, String> json) {
    String fName = json['first_name']!;
    String? lName = json['last_name'];

    return User(fName, lastName: lName ?? "Doe");
  }

  set otherName(String name) => names.add(name);

  static void getSpecies () {
    print(SPECIES);
    User usr = User("Darwin", trialTime: 30);
    print(usr);
  }

  String get otherNames {
    StringBuffer bfr = StringBuffer();
    // for(String otherName in names) {
    //   bfr.write(otherName);
    //   bfr.write(" ");
    // }
    bfr.writeAll(this.names, " ");
    print("Here's the names");
    bfr.writeln("\nAbove");
    bfr.writeln("are the names");
    return bfr.toString();
  }

  @override
  String toString() {
    return("User(firstName: ${this.firstName}, lastName: ${this.lastName}, otherNames:${this.names})");
  }
}


class PrivateKey {
  String pw = "pwd";

  PrivateKey._();

  static final PrivateKey _pk = PrivateKey._();

  static PrivateKey getPk() => _pk;

  factory PrivateKey() {
    return _pk;
  }
}