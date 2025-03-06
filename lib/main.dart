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

      await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoadingNetworks = false;
      _wifiNetworks = ['Network 1', 'Network 2', 'Network 3']; // Replace with fetched networks
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Edit'),
          onPressed: () {
          },
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(),
            ),

            CupertinoListSection.insetGrouped(
              children: <Widget>[
                CupertinoListTile(
                  leading: CircleAvatar(
                    child: Text('MJ'),
                  ),
                  title: Text('Artienda, Mary Joyce'), 
                  subtitle: Text('Apple Account, iCloud, and more'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                  },
                ),
                CupertinoListTile(
                  title: Text('Apple Account Suggestions'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                  },
                ),
              ],
            ),