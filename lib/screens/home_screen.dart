import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cnc_shop/themes/color.dart';
import 'package:cnc_shop/themes/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SoLRuN Shop',
          style: Theme.of(context).textTheme.headline2,
        ),
        shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
        elevation: 0,
        toolbarHeight: 60,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              height: 60,
            )),
        backgroundColor: kColorsWhite,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/add.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/msg.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/me.svg'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.75),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(color: kColorsCream),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
