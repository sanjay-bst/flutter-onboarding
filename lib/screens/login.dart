import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isValidUserName = true;
  var isValidPassword = true;
  var disabled = true;
  var isLoading = true;
  var isLoggedIn = false;

  void onSubmit(BuildContext context) async {
    final userName = userNameController.text;
    final password = passwordController.text;

    if (userName.isEmpty || password.isEmpty) {
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userName);
    prefs.setString('token', password);

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void toggleSubmitBtnState() {
    setState(() {
      disabled = userNameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          !isValidUserName ||
          !isValidPassword;
    });
  }

  void onNameChangeHandler(_) {
    final userNameLength = userNameController.text.length;
    setState(() {
      isValidUserName = 3 <= userNameLength && userNameLength <= 10;
    });

    toggleSubmitBtnState();
  }

  void onPasswordChangeHandler(_) {
    final passwordLength = passwordController.text.length;

    setState(() {
      isValidPassword = 3 <= passwordLength && passwordLength <= 10;
    });

    toggleSubmitBtnState();
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
                      controller: userNameController,
                      onChanged: onNameChangeHandler,
                      maxLength: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: !isValidUserName
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
                      controller: passwordController,
                      onChanged: onPasswordChangeHandler,
                      maxLength: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: !isValidPassword
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
                        onPressed: disabled ? null : () => onSubmit(context),
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
