import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getNewsData(String category) async {
  var url =
      "http://newsapi.org/v2/everything?q=$category&from=2020-10-25&sortBy=publishedAt&apiKey=26309d0143fd43f08f17cf1444460905";
  http.Response response = await http.get(url);
  Map result = jsonDecode(response.body);
  List newsData = result["articles"];
  return newsData;
}
