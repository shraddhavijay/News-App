import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/services/getNewsData.dart';
import 'package:newsapp/theme/colors.dart';

import 'newsCard.dart';

class ListOfNews extends StatefulWidget {
  final category;
  ListOfNews({Key key, this.category});
  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  List entries = [];

  generateList() async {
    entries = await getNewsData(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return entries!=null
        ? entries.length!=0?Container(
            color: detailsPageBackground,
            child: width < height
                ? ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(cardDetails: entries[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10,
                    ),
                  )
                : new GridView.builder(
                    itemCount: entries.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.55,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(cardDetails: entries[index]);
                    },
                  )): Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
