import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/detailsPage.dart';
import 'package:newsapp/widgets/textStyles.dart';


class NewsCard extends StatefulWidget {

  final cardDetails;
  NewsCard({Key key, this.cardDetails});
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
 
  @override
  Widget build(BuildContext context) {

  
             return GestureDetector(

               onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(cardDetails: widget.cardDetails,)),
                  );
               },
               
               child: Card(              
                 elevation: 3,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
            // height: MediaQuery.of(context).size.height/3,
            child:Column(
              children: [              
               Container(
            height: MediaQuery.of(context).size.height/3.5,
            child:Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Map.from(widget.cardDetails).containsKey("urlToImage")?Image.network(
                  widget.cardDetails["urlToImage"].toString()!="null"?
                  widget.cardDetails["urlToImage"].toString()
                  :"https://lh3.googleusercontent.com/proxy/Se-T1jlRIpZUE5SimQEFQvVCFb4_uGAEJlgEyhxpcw70oU252r_mZTaBssKTQfHfFZ03Ob6RtHYiB6kk5tdduBKgzQgeAw_Ok7bY6aIrXoqHWcKWJChEMIkv23FZEi-Oyw",
                  fit: BoxFit.fill,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ? 
                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ):Container(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                margin: EdgeInsets.all(5),
              )),
             Container(
                padding: EdgeInsets.all(10),
               child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                newsTitle(widget.cardDetails["title"]??"",18),
                SizedBox(height: 10,),
              subTitle(widget.cardDetails["publishedAt"]??"",13),
              ]
              
              )),
             
            ],)
            //color: Colors.amber[colorCodes[index]],
           
          ));    
  }
}