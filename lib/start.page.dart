import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpbor/localization.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                color: Colors.orange,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/request');
                  },
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: FaIcon(
                      FontAwesomeIcons.lightLifeRing,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                  title: Text(
                    'You need support?',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0
                    )
                  ),
                  subtitle: Text(
                    'Create an request via phone call or app an we will spread the word!',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0
                    )
                  ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Card(
                color: Colors.orange,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/help');
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.lightHandsHeart,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    'Be a helpbor hero or heroine yourself!',
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    )
                  ),
                  subtitle: Text(
                    'Start now helping your neighbors in need.',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0
                    )
                  ),
                )
              )
            ),
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