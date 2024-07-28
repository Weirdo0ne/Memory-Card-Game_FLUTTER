import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Credits')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background/backgroundcredit.png', // Corrected asset path
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Developer',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
              trailing: Text(
                'KAY_Team',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
            ),
            ListTile(
              title: Text(
                'Built With',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
              trailing: Text(
                'Flutter',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
            ),
            ListTile(
              title: Text(
                'Version',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
              trailing: Text(
                'v${_packageInfo.version}',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
            ),
            ListTile(
              title: Text(
                'Email Me',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
              trailing: Text(
                'Dreamteam3.com',
                style: TextStyle(color: Colors.white), // Add color to text
              ),
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'team3.com',
                  query:
                      'subject=App Feedback (${_packageInfo.version})', //add subject and body here
                );

                final String url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
