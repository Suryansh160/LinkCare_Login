import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController controller;

  CustomTextField({
    required this.label,
    this.isPassword = false,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (_) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  static const routeName = '/signin';

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Button function
  Widget button(IconData icon, Color color) {
    return IconButton(
      iconSize: 30,
      icon: Icon(icon, color: color),
      onPressed: () {
        // Handle button press (Google, Facebook, Apple login)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenHeight * 0.15),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(text: "Let's "),
                      TextSpan(
                          text: "Sign", style: TextStyle(color: Colors.blue)),
                      TextSpan(text: " you in"),
                    ],
                  ),
                ),
                SizedBox(height: ScreenHeight * 0.13),
                // FractionallySizedBox(
                //   widthFactor: ScreenWidth * 0.9,
                //   child: Text(
                //     'Welcome Back, You have been missed',
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                //   ),
                // ),
                // SizedBox(height: 60),

                // Input fields
                CustomTextField(
                  label: 'Email, Phone & Username',
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                ),

                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(
                      top: ScreenHeight * 0.01, right: ScreenWidth * 0.05),
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: ScreenHeight * 0.055),

                // Sign-in Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenWidth * 0.1),
                  child: ElevatedButton(
                    onPressed: () {
                      print(_emailController.text);
                      print(_passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenHeight * 0.01,
                            horizontal: ScreenWidth * 0.25),
                        minimumSize:
                            Size(ScreenWidth * 0.8, ScreenHeight * 0.06)),
                    child: Text('Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ),
                ),
                SizedBox(height: ScreenHeight * 0.04),

                // OR Divider
                Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text('or', style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
                SizedBox(height: ScreenHeight * 0.04),

                // Social Media Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    button(FontAwesomeIcons.google, Colors.black),
                    button(FontAwesomeIcons.facebook, Colors.blue),
                    button(FontAwesomeIcons.apple, Colors.black),
                  ],
                ),
                SizedBox(height: ScreenHeight * 0.06),

                // Register Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/Register');
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
