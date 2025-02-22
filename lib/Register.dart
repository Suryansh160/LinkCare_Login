import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CostumTextField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final bool isObscure;
  final IconData icon;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  CostumTextField({
    required this.text,
    required this.keyboardType,
    this.isObscure = false,
    required this.icon,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10), // Spacing for icon
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: isObscure,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              focusNode: focusNode,
              onFieldSubmitted: (_) {
                if (nextFocusNode != null) {
                  FocusScope.of(context).requestFocus(nextFocusNode);
                }
              },
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
      ),
    );
  }
}

class Register extends StatelessWidget {
  static const routeName = '/Register';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _genderFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, top: 100, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
                  TextSpan(text: 'Let’s '),
                  TextSpan(
                      text: 'Register ', style: TextStyle(color: Colors.blue)),
                  TextSpan(text: 'your account'),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Hello user, you have a great journey ahead!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 15),
            CostumTextField(
              text: 'Name',
              keyboardType: TextInputType.text,
              isObscure: false,
              icon: FontAwesomeIcons.user,
              controller: _nameController,
              focusNode: _nameFocusNode,
              nextFocusNode: _genderFocusNode,
            ),
            SizedBox(height: 10),
            CostumTextField(
              text: 'Gender',
              keyboardType: TextInputType.text,
              isObscure: false,
              icon: Icons.accessibility_new,
              controller: _genderController,
              focusNode: _genderFocusNode,
              nextFocusNode: _phoneFocusNode,
            ),
            SizedBox(height: 10),
            CostumTextField(
              text: 'Phone',
              keyboardType: TextInputType.phone,
              isObscure: false,
              icon: FontAwesomeIcons.phone,
              controller: _phoneController,
              focusNode: _phoneFocusNode,
              nextFocusNode: _emailFocusNode,
            ),
            SizedBox(height: 10),
            CostumTextField(
              text: 'Email',
              keyboardType: TextInputType.emailAddress,
              isObscure: false,
              icon: Icons.email_outlined,
              controller: _emailController,
              focusNode: _emailFocusNode,
              nextFocusNode: _passwordFocusNode,
            ),
            SizedBox(height: 10),
            CostumTextField(
              text: 'Password',
              keyboardType: TextInputType.text,
              isObscure: true,
              icon: Icons.lock,
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print(_nameController.text);
                  print(_emailController.text);
                  print(_genderController.text);
                  print(_passwordController.text);
                  print(_phoneController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
