import 'package:flutter/material.dart';
import 'package:newsapp/services/launchUrl.dart';
import 'package:newsapp/theme/colors.dart';

Widget readMore(String url)
{
  return RaisedButton(
    onPressed: () {
      launchURL(url);    
    },
    color: appbarTextColor,
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Continue Reading',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}