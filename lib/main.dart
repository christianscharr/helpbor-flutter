import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helpbor/help.page.dart';
import 'package:helpbor/localization.dart';
import 'package:helpbor/request.page.dart';
import 'package:helpbor/start.page.dart';

void main() => runApp(HelborApp());

class HelborApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'helpbor',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => StartPage(),
        '/request': (context) => RequestPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/help': (context) => HelpPage(),
      },
      localizationsDelegates: [
        const HelpborLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // english
        const Locale('de'), // german
      ],
    );
  }
}
