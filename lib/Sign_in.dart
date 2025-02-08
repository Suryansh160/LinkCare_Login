import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    inputText(String text, bool did) {
      return SizedBox(
        width: 360,
        child: TextField(
          obscureText: did,
          decoration: InputDecoration(
            labelText: text,
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

    button(IconData icon, Color colora) {
      return IconButton(
        iconSize: 30,
        icon: Icon(
          icon,
          color: colora,
        ), // Use Icons.google for the Google icon
        onPressed: () {
          // Handle button press
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                textAlign: TextAlign.start,
                'Lets Sign you in',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Welcome Back,You have been missed',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              inputText('Email,Phone & Username', false),
              SizedBox(
                height: 20,
              ),
              inputText('Password', true),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(top: 10, right: 31),
                child: Text(
                  'Forgot Password ?',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                        Divider(), // Expands the Divider to take up available space
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        Divider(), // Expands the Divider to take up available space
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  button(FontAwesomeIcons.google, Colors.black),
                  button(FontAwesomeIcons.facebook, Colors.blue),
                  button(FontAwesomeIcons.apple, Colors.black),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/Register');
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
