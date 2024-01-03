import 'spin_the_block_5.dart';

abstract class User {
  String firstName;
  String lastName;
  var middlename;

  User(this.firstName, this.lastName);

  User.Anonymous () : this("n/a", "n/a");

  User.NoLastName (this.firstName) : lastName = "";

  Map get details => {
    "first_name": firstName,
    "last_name": lastName
  };

  void printDetails ();

  String get fullname => "$firstName, $lastName";

  @override
  String toString() => this.details.toString();
}

class Admin extends User {
  String password;

  Admin(String firstName, String lastName, String password)
      : this.password = password,
        super(firstName, lastName);

  @override
  Map get details {
    Map adminDetails = super.details;
    adminDetails['password'] = password;
    return adminDetails;
  }

  @override
  void printDetails() {
    print(details);
    print(super.details);
  }

  @override
  String toString() => "This is a $runtimeType";
}

class CEO extends Admin {
  CEO() : super("", "", "pass");

}
void main() {
  DatabaseRepo databaseRepo = new DatabaseRepo.Db();
  print(databaseRepo.conn);
  print(databaseRepo.tables);
  databaseRepo.deleteTable("users_tbl");

  DatabaseRepo fileRepo = new DatabaseRepo.File();
  print(fileRepo.conn);
  print(fileRepo.tables);
  fileRepo.deleteTable("user data.txt");
}