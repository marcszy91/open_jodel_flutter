import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_jodel_flutter/repository/signup/signup_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_jodel_flutter/model/login/login_response_model.dart';
import 'package:open_jodel_flutter/model/user/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final prefs = await SharedPreferences.getInstance();

    UserModel userModel = new UserModel( username: usernameController.text,
        email: emailController.text, password: passwordController.text, publicId: "");
    LoginResponseModel loginResponseModel = await signUp(userModel);
    if (loginResponseModel.status == "success") {
      prefs.setString('Authorization', loginResponseModel.authorization);
    } else {
      _showSignUpFailedDialog();
    }
  }

  Future<void> _showSignUpFailedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).signUpFailed),
          content: SingleChildScrollView(
              child:
              Text(AppLocalizations.of(context).userAlreadyExist)),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).signUp),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.orange),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: AppLocalizations.of(context).email,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.orange),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: AppLocalizations.of(context).username,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.orange),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: AppLocalizations.of(context).password,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    icon: Icon(Icons.lock_open, color: Colors.orange),
                    label: Text(
                      AppLocalizations.of(context).createNewAccount,
                      style: TextStyle(color: Colors.orange),
                    ),
                    onPressed: () {
                      _signUp();
                    },
                  ),
                ),
              ],
            )));
  }
}
