import 'package:cnc_shop/themes/color.dart';
import 'package:cnc_shop/widget/input_decoration.dart';
import 'package:cnc_shop/widget/main_widget.dart';
import 'package:cnc_shop/widget/input_decoration.dart';
import 'package:cnc_shop/widget/main_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                    child: Text('CNC Shop',
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CreateUsername(),
                        CreatePassword(),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', (route) => false);
                            }
                          },
                          child: MainBtnWidget(
                              colorBtn: kColorsPurple,
                              textBtn: 'Login',
                              isTransparent: false,
                              haveIcon: false))),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: kColorsPurple)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
                    child: Container(
                        child: Row(children: [
                      Expanded(child: Divider(color: kColorsGrey)),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("or",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: kColorsGrey)),
                      ),
                      Expanded(child: Divider(color: kColorsGrey)),
                    ])),
                  ),
                  InkWell(
                      onTap: () {},
                      child: MainBtnWidget(
                          colorBtn: kColorsPurple,
                          textBtn: 'Login with Google',
                          isTransparent: true,
                          haveIcon: true)),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 40),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Don\'t have an account? ',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: kColorsGrey)),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text('Sign Up',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: kColorsPurple))),
                            ])),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CreateUsername() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          decoration: InputDecorationWidget(context, 'Username'),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter username";
            }
            return null;
          },
          onChanged: (value) {
            username = value;
          },
        ));
  }

  Widget CreatePassword() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kColorsPurple),
          decoration: InputDecorationWidget(context, 'Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter password";
            }
            return null;
          },
          onChanged: (value) {
            password = value;
          },
        ));
  }
}
