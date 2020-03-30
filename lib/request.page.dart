import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpbor/localization.dart';

class RequestPage extends StatefulWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 249, 252),
      appBar: AppBar(
        title: Image.asset(
          'assets/helpbor-logo-horizontal-white.png',
          fit: BoxFit.contain,
          height: 40,
        )
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      bottomSheet: ListTile(
        leading: FaIcon(
          FontAwesomeIcons.infoCircle,
        ),
        title: Text(
            'Please note: This is an early prototype',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 12.0
            )
        ),
        subtitle: Text(
            'This was made in just 72h for the #CodevsCovid19 online hackathon @hackzurich. Things may break or go wrong. Please be respectful.',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 12.0
            )
        ),
      )
    );
  }
}