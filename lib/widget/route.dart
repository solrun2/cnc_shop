import 'package:cnc_shop/screens/add_product.dart';
import 'package:cnc_shop/screens/login_screen.dart';
import 'package:cnc_shop/screens/product_screen.dart';
import 'package:cnc_shop/screens/profile_screen.dart';
import 'package:cnc_shop/screens/register_screen.dart';
import 'package:cnc_shop/screens/topup.dart';
import 'package:cnc_shop/screens/transaction_screen.dart';
import 'package:cnc_shop/screens/withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:cnc_shop/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/add_product': (BuildContext context) => AddProductScreen(),
  '/productinfo': (BuildContext context) => ProductInfoScreen(),
  '/profile': (BuildContext context) => ProfileScreen(),
  '/top-up': (BuildContext context) => TopUpScreen(),
  '/withdraw': (BuildContext context) => WithdrawScreen(),
  '/transaction': (BuildContext context) => TransactionScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => RegisterScreen(),
};
