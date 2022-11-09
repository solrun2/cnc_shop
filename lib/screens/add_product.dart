import 'dart:io';

import 'package:cnc_shop/widget/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cnc_shop/themes/color.dart';
import 'package:cnc_shop/widget/input_decoration.dart';
import 'package:image_picker/image_picker.dart';

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

  File? imageFile;
  final picker = ImagePicker();

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
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon:
                  SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite),
            )
          ],
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          showBottomSheet(context);
                        },
                        child: imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(imageFile!,
                                    width: 153, height: 153, fit: BoxFit.cover))
                            : Container(
                                width: 153,
                                height: 153,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: kColorsRed),
                              ),
                      ),
                    ),
                    CreateProductCategory(),
                    CreateProductName(),
                    CreateProductPrice(),
                    CreateProductQuantity(),
                    CreateProductDescription(),
                  ])),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    child: MainBtnWidget(
                        colorBtn: kColorsPurple,
                        textBtn: 'Confirm',
                        isTransparent: false,
                        haveIcon: false),
                  )),
            )
          ],
        ));
  }

  Widget CreateProductName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product name';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Name')),
    );
  }

  Widget CreateProductPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product price';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Price')),
    );
  }

  Widget CreateProductQuantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product quantity';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Quantity')),
    );
  }

  Widget CreateProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter product description';
            }
            return null;
          },
          decoration: InputDecorationWidget(context, 'Description')),
    );
  }

  Widget CreateProductCategory() {
    List<String> category = [
      'Pen',
      'Book',
      'Paper',
      'Eraser',
      'Marker',
      'Folder'
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: InputDecorator(
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
                borderSide: BorderSide(color: kColorsGrey, width: 1),
              ),
              errorStyle: Theme.of(context).textTheme.bodyText2),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: productCategory,
                icon: SvgPicture.asset('assets/icons/down.svg',
                    color: kColorsGrey),
                elevation: 3,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: kColorsPurple),
                items: category.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    productCategory = value.toString();
                  });
                }),
          ),
        ));
  }

  Future<void> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(children: [
              ListTile(
                onTap: () {
                  openGallery(context);
                },
                leading: SvgPicture.asset(
                  'assets/icons/gallery.svg',
                  color: kColorsPurple,
                ),
                title: Text('Gallery',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              ListTile(
                onTap: () {
                  openCamera(context);
                },
                leading: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  color: kColorsPurple,
                ),
                title: Text('Camera',
                    style: Theme.of(context).textTheme.subtitle1),
              )
            ]),
          );
        });
  }

  openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No Image selected');
      }
    });
    Navigator.of(context).pop();
  }
}
