import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text('Open Jodel'),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
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
                        AppLocalizations.of(context).login,
                        style: TextStyle(color: Colors.orange),
                      )),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton.icon(
                            icon: Icon(Icons.app_registration,
                                color: Colors.white),
                            label: Text(AppLocalizations.of(context).createNewAccount,
                                style: TextStyle(color: Colors.white))),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                            icon: Icon(Icons.settings, color: Colors.white),
                            label: Text(AppLocalizations.of(context).settings,
                                style: TextStyle(color: Colors.white)))
                      ],
                    )),
              ],
            )));
  }
}
