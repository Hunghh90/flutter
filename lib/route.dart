 import 'package:demo_ss1/detail.dart';
import 'package:demo_ss1/form_example.dart';
import 'package:flutter/cupertino.dart';

 final Map <String, WidgetBuilder> routes = {
   FormExample.routeName :(context) => FormExample(),
   Detail.routeName: (context) => Detail(),
 };