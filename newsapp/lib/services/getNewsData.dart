import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/widgets/popUps.dart';

//api1= 26309d0143fd43f08f17cf1444460905
//api2= c706bcbc59ad4990b509b83d515be420
Future<List> getNewsData(String category) async {
  List newsData=[];
  try{
  var url =
      "http://newsapi.org/v2/everything?q=$category&from=2020-10-25&sortBy=publishedAt&apiKey=c706bcbc59ad4990b509b83d515be420";
  http.Response response = await http.get(url);
  Map result = jsonDecode(response.body);
  if(result["status"]=="ok")
    newsData = result["articles"];
  else
     showToast("Request Exceeded");
  }catch(e)
  {
      showToast("Error! Please check your Internet");
  }
  return newsData;
}
