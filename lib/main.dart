import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cnc_shop/themes/style.dart';
import 'package:cnc_shop/widget/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/login',
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
