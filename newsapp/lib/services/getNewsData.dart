import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getNewsData(String category) async {
  var url =
      "http://newsapi.org/v2/everything?q=$category&from=2020-10-25&sortBy=publishedAt&apiKey=c706bcbc59ad4990b509b83d515be420";
  http.Response response = await http.get(url);
  Map result = jsonDecode(response.body);
  List newsData = result["articles"];
  return newsData;
}
