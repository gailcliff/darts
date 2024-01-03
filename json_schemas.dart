
import 'dart:convert' as encoding;

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_schemas.g.dart';

// @JsonSerializable()
// class Usr {
//   @JsonKey(name: "first_name") final String firstName;
//   @JsonKey(name: "last_name") final String lastName;
//   @JsonKey(name: "date_created", toJson: _dateToJson) DateTime? dateJoined;
//   @JsonKey(name: "pwd") String? password;
//
//   Usr({required this.firstName, required this.lastName}) {
//     this.dateJoined ??= DateTime.now();
//   }
//
//   factory Usr.fromJson(String jsonStr) => _$UsrFromJson(encoding.jsonDecode(jsonStr));
//
//   static _dateToJson (DateTime date) => DateFormat("YYYY-MM-dd").format(date);
//
//   Map<String, dynamic> get dict => _$UsrToJson(this);
//
//   @override
//   String toString() {
//     return encoding.jsonEncode(dict);
//   }
// }

@JsonSerializable() //annotate a class as JsonSerializable to indicate that it is a json model
class User {
  @JsonKey(name: "user_name") String userName; //use JsonKey annotation to provide a key for a field
  //not necessary if you want the field name in the class to be the same as the one in the json
  @JsonKey(name: "password") String password;
  @JsonKey(
      name: "date_created",
      toJson: _dateToStr //providing a custom function for converting this field to json
  ) DateTime dateCreated;

  User({required this.userName, required this.password, DateTime? dateCreated}) : this.dateCreated = dateCreated ?? DateTime.now();

  factory User.fromJson(String jsonStr) => _$UserFromJson( //this function will be auto-generated to convert the provided map into an instance of this class
      encoding.jsonDecode(jsonStr) //dart's own internal function for decoding json string to a map
  );

  Map<String, dynamic> mapify() => _$UserToJson(this); //this function will be auto-generated to convert this class into a json map

  static _dateToStr(DateTime date) => DateFormat("yyyy-MM-dd").format(date);

  @override
  String toString() => encoding.jsonEncode( //jsonEncode is dart's own internal function for converting map to json string
      mapify()
  );
}