import 'package:flutter/material.dart';

import 'image.dart';


void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Linkdin(),
      },
    ),
  );
}