import 'package:flutter/material.dart';
import 'package:methodchannel/platform.dart';

class HomePage extends StatefulWidget {
  final PlatformInfo platformInfo;

  const HomePage({
    Key? key,
    this.platformInfo: const PlatformInfo(),
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(platformInfo);
}

class _HomePageState extends State<HomePage> {
  String _platform = '…';

  _HomePageState(PlatformInfo platformInfo) {
    platformInfo.platform().then((platform) {
      setState(() {
        _platform = platform;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'It is running on:',
                style: themeData.textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _platform,
                style: themeData.textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
