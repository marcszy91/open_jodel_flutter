import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsScreen extends StatefulWidget {
  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  final TextEditingController apiUrlController = TextEditingController();

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiUrlController.text = prefs.getString("APIURL") ?? "http://localhost:5000";
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }


  @override
  void dispose() {
    apiUrlController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('APIURL', apiUrlController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).settings),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: apiUrlController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: AppLocalizations.of(context).apiUrl,
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
                  icon: Icon(Icons.save, color: Colors.orange),
                  label: Text(
                    AppLocalizations.of(context).save,
                    style: TextStyle(color: Colors.orange),
                  ),
                  onPressed: () {
                    _save();
                  },
                ),
              ),
            ])));
  }
}
