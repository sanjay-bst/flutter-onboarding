import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/router.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _isValidUserName = true;
  var _isValidPassword = true;
  var _disabled = true;

  void _onSubmit(BuildContext context) async {
    final userName = _userNameController.text;
    final password = _passwordController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userName);
    prefs.setString('token', password);

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRouter.homePage,
      (Route<dynamic> route) => false,
    );
  }

  void _toggleSubmitBtnState() {
    setState(() {
      _disabled = _userNameController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          !_isValidUserName ||
          !_isValidPassword;
    });
  }

  void _onNameChangeHandler(_) {
    final userNameLength = _userNameController.text.length;
    setState(() {
      _isValidUserName = 3 <= userNameLength && userNameLength <= 10;
    });

    _toggleSubmitBtnState();
  }

  void _onPasswordChangeHandler(_) {
    final passwordLength = _passwordController.text.length;
    setState(() {
      _isValidPassword = 3 <= passwordLength && passwordLength <= 10;
    });

    _toggleSubmitBtnState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gametv-logo.jpg',
                height: 32,
                width: 134,
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                elevation: 1,
                shadowColor: const Color.fromRGBO(0, 26, 121, 0.08),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter Name',
                        hintStyle: TextStyle(
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        counterText: '',
                      ),
                      keyboardType: TextInputType.text,
                      controller: _userNameController,
                      onChanged: _onNameChangeHandler,
                      maxLength: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: !_isValidUserName
                          ? const Text(
                              'Minimum characters must be greater than or equal to 3',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        counterText: '',
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: _passwordController,
                      onChanged: _onPasswordChangeHandler,
                      maxLength: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: !_isValidPassword
                          ? const Text(
                              'Minimum characters must be greater than or equal to 3',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // fixedSize: const Size(double.infinity, 40),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: _disabled ? null : () => _onSubmit(context),
                        child: const Text('Save & continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        exit(0);
      },
    );
  }
}
