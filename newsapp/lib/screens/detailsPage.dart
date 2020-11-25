import 'package:flutter/material.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:newsapp/widgets/buttons.dart';
import 'package:newsapp/widgets/textStyles.dart';

class DetailsPage extends StatefulWidget {
  final cardDetails;
  DetailsPage({Key key, this.cardDetails});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        toolbarHeight: 70,
        collapsedHeight: 90,
        backgroundColor: Colors.transparent,
        expandedHeight: 300,
        floating: true,
        pinned: false,
        snap: false,
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRRect(
            child: Map.from(widget.cardDetails).containsKey("urlToImage")
                ? Image.network(
                    widget.cardDetails["urlToImage"].toString() != "null"
                        ? widget.cardDetails["urlToImage"].toString()
                        : "https://lh3.googleusercontent.com/proxy/Se-T1jlRIpZUE5SimQEFQvVCFb4_uGAEJlgEyhxpcw70oU252r_mZTaBssKTQfHfFZ03Ob6RtHYiB6kk5tdduBKgzQgeAw_Ok7bY6aIrXoqHWcKWJChEMIkv23FZEi-Oyw",
                    fit: BoxFit.fill,
                  )
                : Container(),
          ),
          titlePadding: EdgeInsets.fromLTRB(80, 0, 0, 35),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
            color: detailsPageBackground,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                subTitle(widget.cardDetails["publishedAt"] ?? "", 15),
                SizedBox(
                  height: 10,
                ),
                newsTitle(widget.cardDetails["title"] ?? "", 22),
                SizedBox(
                  height: 10,
                ),
                textWithUnderline(widget.cardDetails["author"] ?? "", 16),
                SizedBox(
                  height: 10,
                ),
                paragraphText(widget.cardDetails["description"] ?? "", 16),
                SizedBox(
                  height: 10,
                ),
                paragraphText(widget.cardDetails["content"] ?? "", 16),
                SizedBox(
                  height: 30,
                ),
                readMore(widget.cardDetails["url"]),
              ],
            ));
      }, childCount: 1))
    ]));
  }
}
