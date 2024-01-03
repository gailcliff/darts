
import 'dart:convert' as transformer;
import 'dart:io';

import 'package:http/http.dart' as http;

void main () async {

  List<Comment> commentsBelow = await getComments();
  commentsBelow.forEach((comment) => print(comment));

  String url = "https://jsonplaceholder.typicode.com/todos/5";

  try {
    final httpResponse = await http.get(Uri.parse(url));

    final statusCode = httpResponse.statusCode;

    if (statusCode == 200) {
      print("Request successful: ${httpResponse.reasonPhrase}");

      String result = httpResponse.body;

      Todo item = Todo.fromJson(transformer.jsonDecode(result));
      print(item);

    } else {
      throw HttpException('$statusCode');
    }
  } on SocketException catch(error) {
    print("Socket error: $error");
  } on HttpException catch(error) {
    print("Http exception: $error");
  } on FormatException catch(e) {
    print("Json invalid: $e");
  } catch(error) {
    print("Unknown error: $error");
  }
}

Future<List<Comment>> getComments() async {
  
  http.Client client = http.Client();
  final request = http.Request("GET", Uri.parse("https://jsonplaceholder.typicode.com/comments"));

  final response = await client.send(request);

  if(response.statusCode == 200) {
    StringBuffer result = StringBuffer();
    
    await for(var token in response.stream.transform(transformer.utf8.decoder)) {
      result.write(token);
    }

    List comments = transformer.jsonDecode(result.toString());
    return comments.map((comment) => Comment.fromJson(comment)).toList();
  } else {
    throw Exception("${response.statusCode} Error occurred making the request: ${response.reasonPhrase}");
  }
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['completed'] as bool
    );
  }

  @override
  String toString() {
    return "Todo item #$id: $title\n{User ID: $userId, Completed: $completed})";
  }
}

class Comment {
  int postId, id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  factory Comment.fromJson(Map<String, Object?> json) {
    return Comment(
      json['postId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String
    );
  }

  @override
  String toString() {
    return("$id. Comment #$postId (Posted by $name<$email>)\n$body\n");
  }
}