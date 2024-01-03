part of 'spin_the_block_8.dart';

class AppRoute {

  String location;
  Map<String, String> params;

  AppRoute(this.location, {this.params = const {}}){
    if(location.isNotEmpty) {
      if (location.substring(location.length - 1, location.length) == "/") {
        location = location.substring(0, location.length - 1);
      }
    }
    else { location = "/"; }
  }

  factory AppRoute.fromUrl(String url) {
    Uri uri = Uri.parse(Uri.decodeFull(url));

    return AppRoute(
        uri.path,
        params: uri.queryParameters
    );
  }

  String toUrl () {
    if(params.isNotEmpty) {
      StringBuffer sb = StringBuffer("$location?");

      params.forEach((key, value) {
        sb.write("$key=$value&");
      });
      return Uri.encodeFull(sb.toString());
    }

    return location;
  }
}

void mainn () {
  String? a = Uri.encodeFull("https://google.com/users/?username=Clifford Gail Odhiambo&username=123 456&password=123");

  AppRoute route = AppRoute.fromUrl(a);
  print(route.location);
  print(route.params);
  print(route.toUrl());


  AppRoute b = AppRoute.fromUrl("");
  print(b.location);
  print(b.params);

  final foo = <String, String>{"tab" : "-1"};

  print(int.tryParse(foo['tab'] ?? ""));
}
