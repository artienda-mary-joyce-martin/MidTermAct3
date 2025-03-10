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

            CupertinoListSection.insetGrouped(
              children: <Widget>[
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.airplane),
                  title: Text('Airplane Mode'),
                  trailing: CupertinoSwitch(value: false, onChanged: (value) {}),
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.wifi),
                  title: Text('Wi-Fi'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => WifiSettings(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.bluetooth),
                  title: Text('Bluetooth'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Off'), 
                      CupertinoListTileChevron(),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => BluetoothSettings()),
                    );
                  },
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.device_phone_landscape),
                  title: Text('Cellular'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                  },
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.personalhotspot),
                  title: Text('Personal Hotspot'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                  },
                ),
                CupertinoListTile(
                  leading: Icon(CupertinoIcons.battery_full),
                  title: Text('Battery'),
                  trailing: CupertinoListTileChevron(),
                  onTap: () {
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WifiSettings extends StatefulWidget {
  @override
  _WifiSettingsState createState() => _WifiSettingsState();
}

class _WifiSettingsState extends State<WifiSettings> {
  bool _wifiEnabled = false;
  bool _isLoadingNetworks = false;
  List<String> _wifiNetworks = [];

  Future<void> _fetchWifiNetworks() async {
    setState(() {
      _isLoadingNetworks = true;
      _wifiNetworks = [];
    });

    await Future.delayed(Duration(seconds: 5));

    setState(() {
      _isLoadingNetworks = false;
      _wifiNetworks = ['#GigaSmartWiFi', '_FREE Smart WiFi @HCC', 'HCC_CpELab'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Wi-Fi'),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Icon(CupertinoIcons.wifi, size: 60),
                      SizedBox(height: 10),
                      Text('Wi-Fi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        'Connect to Wi-Fi, view available networks, and manage settings for joining networks and nearby hotspots.',
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Learn more...'),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Wi-Fi'),
                    CupertinoSwitch(
                      value: _wifiEnabled,
                      onChanged: (value) async {
                        setState(() {
                          _wifiEnabled = value;
                        });
                        if (value) {
                          await _fetchWifiNetworks();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (_wifiEnabled)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('NETWORKS'),
                          if (_isLoadingNetworks) Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CupertinoActivityIndicator(),
                          ),
                        ],
                      ),
                      Column(
                        children: _wifiNetworks.map((network) {
                          return CupertinoListTile(
                            title: Text(network),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 8),
                                Icon(CupertinoIcons.info_circle),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Text('AirDrop, AirPlay, Notify When Left Behind, and improved location accuracy require Wi-Fi.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BluetoothSettings extends StatefulWidget {
  @override
  _BluetoothSettingsState createState() => _BluetoothSettingsState();
}

class _BluetoothSettingsState extends State<BluetoothSettings> {
  bool _bluetoothEnabled = false;
  bool _isLoadingDevices = false;
  List<String> _bluetoothDevices = [];

  Future<void> _fetchBluetoothDevices() async {
    setState(() {
      _isLoadingDevices = true;
      _bluetoothDevices = [];
    });

    await Future.delayed(Duration(seconds: 5));

    setState(() {
      _isLoadingDevices = false;
      _bluetoothDevices = ['Headphones', 'Speaker', 'Keyboard'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Bluetooth'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.bluetooth, size: 60),
                  SizedBox(height: 10),
                  Text('Bluetooth', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'Connect to Bluetooth devices, view available devices, and manage settings for pairing.',
                    textAlign: TextAlign.center,
                  ),