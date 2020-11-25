import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/services/getNewsData.dart';

import 'newsCard.dart';

class ListOfNews extends StatefulWidget {

  final category;
  ListOfNews({Key key, this.category});
  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
 
  List entries=[];
  final List<int> colorCodes = <int>[600, 500, 100];


  generateList() async{
      entries= await getNewsData(widget.category);  
      debugPrint(entries.toString());
      setState(() {    
      });
  }

  @override
  void initState() {
    super.initState();
    generateList();
  }


  @override
  Widget build(BuildContext context) {
    return entries.length!=0?Container(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return NewsCard(cardDetails:entries[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ):Center(child: CircularProgressIndicator(),);
  }
}