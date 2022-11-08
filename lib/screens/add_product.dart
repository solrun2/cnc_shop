import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cnc_shop/themes/color.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  String? productCategory,
      productName,
      productPrice,
      productQuantity,
      productDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: kColorsWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Product  ',
            style: Theme.of(context).textTheme.headline3,
          ),
          shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: kColorsPurple,
          actions: [
            IconButton(
              onPressed: () {},
              icon:
                  SvgPicture.asset('assets/icons/msg.svg', color: kColorsWhite),
            ),
            IconButton(
              onPressed: () {},
              icon:
                  SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite),
            )
          ],
        ),
        body: ListView(
          children: [
            Form(key: formKey, child: Column(children: [CreateProductName()])),
          ],
        ));
  }

  Widget CreateProductName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      style: Theme.of(context).textTheme.subtitle1,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter product name';
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: kColorsGrey, width: 1)),
          labelText: 'Category',
          labelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kColorsGrey)),
      onChanged: (value) {
        productName = value;
      },
    );
  }
}
