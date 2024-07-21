import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:url_launcher/url_launcher.dart';

class LockScreen extends StatelessWidget {
  final String linkedInUrl = 'https://www.linkedin.com/in/irawan-dwiarno-p/';

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.lock, size: 100, color: Colors.blue),
            SizedBox(height: 20), // Spacing between icon and text
            Text(
              'Aplikasi Test Terkunci',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40), // Spacing between text and button
            ElevatedButton.icon(
              onPressed: () => launchURL(linkedInUrl),
              icon: Icon(Icons.linked_camera),
              label: Text("Hubungi Developer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
