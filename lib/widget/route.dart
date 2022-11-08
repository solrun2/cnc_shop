import 'package:cnc_shop/screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:cnc_shop/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/add_product': (BuildContext context) => AddProductScreen(),
};
