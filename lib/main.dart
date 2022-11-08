import 'package:flutter/material.dart';
import 'package:cnc_shop/themes/style.dart';
import 'package:cnc_shop/widget/route.dart';

void main() {
  runApp(const myjeng());
}

//
class myjeng extends StatelessWidget {
  const myjeng({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/home',
      routes: routes,
    );
  }
}

//
class mybro extends StatefulWidget {
  const mybro({super.key});

  @override
  State<mybro> createState() => _mybroState();
}

class _mybroState extends State<mybro> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
