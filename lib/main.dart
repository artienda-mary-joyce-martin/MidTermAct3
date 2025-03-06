import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      title: 'Settings',
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isLoadingNetworks = false;
  List<String> _wifiNetworks = [];

    Future<void> _fetchWifiNetworks() async {
    setState(() {
      _isLoadingNetworks = true;
      _wifiNetworks = [];
    });


        setState(() {
      _isLoadingNetworks = false;
      _wifiNetworks = ['Network 1', 'Network 2', 'Network 3']; // Replace with fetched networks
    });
  }