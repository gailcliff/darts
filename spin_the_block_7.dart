
import 'dart:convert' as CONVERTER;
import 'dart:io';
import 'dart:isolate';
import 'package:http/http.dart' as HTTP;
import 'package:http/retry.dart';

import 'counter.dart';

Future<void> foo () async {

  final receivePort = new ReceivePort();

  final isolate = await Isolate.spawn(isolated_count, receivePort.sendPort, debugName: "LONELY");
  receivePort.listen((message) {
    print("message: $message");
    receivePort.close();
    isolate.kill();
  });

  for(int c = -1000; c < -1; c++) {
    print(c);
  }

  Future<int>(() {
    int c = 0;
    for(c = 0; c < 1000; c++) {
      print("isolated: $c");
    }
    return c;
  }).then((value) => throw Exception("Got a int from the future: $value"));
  //
  // Future(() {
  //   for(int c = -1000; c < -1; c++) {
  //     print(c);
  //   }
  // });
}

Future<void> main () async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments/9990889");

  RetryClient? client;
  try {
    client = new RetryClient(
      HTTP.Client(),
      retries: 8,
      when: (response) => response.statusCode == 404,
      onRetry: (a,b,c) => {
        print("Retrying: retry count: $c. Status code: ${b?.statusCode}")
      }
    );

    final HTTP.Response response = await client.get(url);

    String result = CONVERTER.utf8.decode(response.bodyBytes);

    print(result);
    List rawComments = CONVERTER.jsonDecode(result);
    List<Comment> comments = rawComments.map((e) => Comment.fromMap(e)).toList();

    for(Comment comment in comments) {
      print("Comment: $comment\n");
    }
    
    final HTTP.Request request = HTTP.Request("GET", Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    final response1 = await client.send(request);
    final stream = response1.stream;

    StringBuffer sb = new StringBuffer();
    await for (var data in stream.transform(CONVERTER.utf8.decoder)) {
      sb.write(data);
    }

    List rawTodos = CONVERTER.jsonDecode(sb.toString());
    List<Todo> todos = rawTodos.map((e) => Todo.fromMap(e)).toList();

    for(Todo todo in todos) {
      print("Todo: $todo\n");
    }

  } on SocketException catch (e) {
    print("Socket error: $e");
  } on HttpException catch (e) {
    print("HTTP err");
  } finally {
    if(client != null) client.close();
  }
}

class Todo {
  int id, userId;
  String title;
  bool completed;

  Todo(this.id, this.userId, this.title, this.completed);

  factory Todo.fromJson(String json) {

    Map<String, dynamic> container = CONVERTER.jsonDecode(json);

    return new Todo(
        container['id'] as int,
        container['userId'] as int,
        container['title'] as String,
        container['completed'] as bool
    );
  }

  factory Todo.fromMap(Map container) => new Todo(
      container['id'] as int,
      container['userId'] as int,
      container['title'] as String,
      container['completed'] as bool
  );

  Map<String, Object> get map => {
    "id": id,
    "user_id": userId,
    "title": title,
    "completed": completed,
  };

  @override
  String toString() => CONVERTER.jsonEncode(map);
}

class Comment {
  int id, postId;
  String name, email, body;

  Comment(this.id, this.postId, this.name, this.email, this.body);

  factory Comment.fromJson (String json) {
    Map<String, dynamic> container = CONVERTER.jsonDecode(json);

    return Comment(container['id'] as int, container['postId'] as int,
        container['name'] as String, container['email'] as String, container['body'] as String);
  }

  factory Comment.fromMap (Map<String, dynamic> container) => Comment(
      container['id'] as int,
      container['postId'] as int,
      container['name'] as String,
      container['email'] as String,
      container['body'] as String
  );

  Map get mapify => <String, Object> {
    "id": id,
    "post_id": postId,
    "name": name,
    "email": email,
    "body": body
  };

  @override
  String toString() => CONVERTER.jsonEncode(mapify);
}