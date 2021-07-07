import 'package:flutter/material.dart';
import 'package:fondeadora/constants.dart';
import 'package:fondeadora/controllers/user.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailLogged extends StatelessWidget {
  void _launchURL() async {
    String _url = 'https://theysaidso.com';
    await canLaunch(_url)
        ? await launch(_url)
        : throw 'No se puede abrir $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () => _launchURL(),
            child: Row(
              children: [
                Image.network(
                  'https://theysaidso.com/branding/theysaidso.png',
                  width: 20.0,
                ),
                Text('They Said So®'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: kSecondaryText,
              children: [
                TextSpan(text: 'Entraste como '),
                TextSpan(
                  text: context.read<UserController>().current!.email,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
