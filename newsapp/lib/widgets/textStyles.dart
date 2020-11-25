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


Widget paragraphText(String title, double size)
{
  return Text(title,
    style: TextStyle(color: Colors.grey[600],
    fontSize: size,
    fontWeight: FontWeight.bold,
    ),
  );
}

Widget textWithUnderline(String title, double size)
{
  return Text(title,
    style: TextStyle(color: Colors.grey[600],
    fontSize: size,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    ),
  );
}
