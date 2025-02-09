import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  static const routeName = '/Register';

  @override
  Widget build(BuildContext context) {
    inputText(String text, bool did, TextInputType key, IconData icon) {
      return Row(
        children: [
          Icon(icon),
          Container(
            padding: EdgeInsets.only(
              left: 9,
            ),
            width: 350,
            child: TextField(
              obscureText: did,
              keyboardType: key,
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
          ),
        ],
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(text: 'Lets '),
                      TextSpan(
                          text: 'Register ',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: 'your account'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Hello user, you have a greatful journey',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                inputText(
                    'Name', false, TextInputType.text, FontAwesomeIcons.person),
                SizedBox(
                  height: 10,
                ),
                inputText('Gender', false, TextInputType.datetime,
                    Icons.accessibility_new),
                SizedBox(
                  height: 10,
                ),
                inputText('Phone', false, TextInputType.number,
                    FontAwesomeIcons.phone),
                SizedBox(
                  height: 10,
                ),
                inputText(
                    'Email', false, TextInputType.text, Icons.email_outlined),
                SizedBox(
                  height: 10,
                ),
                inputText('Password', true, TextInputType.text, Icons.password),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 30),
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
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account ?',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: Text(
                        "Login",
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
        ));
  }
}
