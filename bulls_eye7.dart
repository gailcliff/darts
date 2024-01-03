import 'dart:convert' as encoding;
import 'dart:io';
import 'package:http/http.dart' as http;

import 'json_schemas.dart';

void main() async{
  final myMap = {
    "first_name": "Cliff",
    "last_name": "Gail"
  };

  var jsonStr = encoding.jsonEncode(myMap);
  print(jsonStr);
  print(jsonStr.runtimeType);

  var backToMap = encoding.jsonDecode("{\"first_name\": \"Cliff\", \"last_name\": \"Gail\"}");
  print(backToMap);
  print(backToMap.runtimeType);

  String? networkCallRes = await fetchData();
  print(networkCallRes ?? "null result due to network error");

  final usrDat = {
    "first_name": "Cliff",
    "last_name": "G",
    "date_created": "2001-11-17",
    "pwd": "12345"
  };

  // Usr usr = Usr.fromJson(encoding.jsonEncode(usrDat));
  User usr = User.fromJson(encoding.jsonEncode(usrDat));
  print(usr);
}

Future<String?> fetchData() async {
  String? response;

  try {
    final data = await http.get(Uri.parse("http://192.168.8.125:8000"));

    if(data.statusCode == HttpStatus.ok) {
      response = data.body;
    }
  } on SocketException catch (e) {
    print("socket error: $e");
  } on HttpException catch (e) {
    print("http error: ${e.message} from ${e.uri}");
  } catch (e) {
    print(e);
  } finally {
    return response;
  }
}