import 'package:flutter/material.dart';
import 'package:newsapp/theme/colors.dart';

Widget newsTitle(String title, double size)
{
  return Text(title,
    style: TextStyle(color: appbarTextColor,
    fontSize: size,
    fontWeight: FontWeight.bold,
    ),
  );
}


Widget subTitle(String title, double size)
{
  return Text(title,
    style: TextStyle(color: Colors.grey[600],
    fontSize: size,
    fontWeight: FontWeight.bold,
    ),
  );
}