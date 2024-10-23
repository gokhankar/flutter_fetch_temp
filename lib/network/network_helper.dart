import "package:http/http.dart" as http;

class NetworkHelper {
  static Future fetchData(link) async {
    try {
      final response = await http.get(Uri.parse(link));
      // print(response.body.toString());
      return response.body;
    } catch (e) {
      print(e.toString());
    }
  }
}
