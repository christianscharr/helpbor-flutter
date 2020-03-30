import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/date_symbol_data_custom.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class HelpborRequest {
  String timestamp;
  String firstName;
  String lastName;
  String zipCode;
  String country;
  String phoneNo;
  String requestType;
  String request;
  String conversationUUID;
  String status;

  HelpborRequest({
    this.timestamp,
    this.firstName,
    this.lastName,
    this.zipCode,
    this.country,
    this.phoneNo,
    this.requestType,
    this.request,
    this.conversationUUID,
    this.status
  });

  factory HelpborRequest.fromJson(Map<String, dynamic> json) {
    return HelpborRequest(
      timestamp: json['timestamp'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      zipCode: json['zipCode'],
      country: json['country'],
      phoneNo: json['phoneNo'],
      requestType: json['requestType'],
      request: json['request'],
      conversationUUID: json['conversationUUID'],
      status: json['status']
    );
  }
}

class _HelpPageState extends State<HelpPage> {
  Future<List<dynamic>> requests;

  Future<List<dynamic>> fetchRecentRequests() async {
    final response = await http.get('https://helpbor.eu.ngrok.io/api/request');

    if (response.statusCode == 200) {
      final Map<String, dynamic> requests = jsonDecode(response.body);
      debugPrint('[DEBUG] API-Response: ' + requests.toString());
      final recentRequests = requests['recentRequests'];
      return recentRequests;
    } else {
      throw Exception('Failed to load requests');
    }
  }

  @override
  void initState() {
    super.initState();
    requests = fetchRecentRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.handsHeart,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text('Provide Help'),
              )
            ]
        ),
      ),
      body: FutureBuilder(
        future: requests,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: new ListView.builder (
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final request = snapshot.data[index];

                  var requestType = request['requestType'];
                  var requestIcon;

                  if (requestType == 'ERRANDS') {
                    requestType = 'Need help with errands from the supermarket.';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.shoppingBasket,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  } else if (requestType == 'LETTER_PARCEL') {
                    requestType = 'Can someone get my letters or parcels from the post office?';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.boxAlt,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  } else if (requestType == 'PHARMACY') {
                    requestType = 'I need some support getting stuff from the pharmacy.';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.pills,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  } else if (requestType == 'DOG_WALK') {
                    requestType = 'Looking for somebody to take my dog out for a walk';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.dogLeashed,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  } else if (requestType == 'CAR_RIDE') {
                    requestType = 'Can someone help me out with a car ride?';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.carSide,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  } else if (requestType == 'OTHER') {
                    requestType = 'I need help with something other.';
                    requestIcon = new FaIcon(
                      FontAwesomeIcons.asterisk,
                      color: Colors.orange,
                      size: 40.0,
                    );
                  }

                  var requestTime = DateTime.parse(request['timestamp']);
                  var timeStr = new DateFormat('yyyy.MM.dd HH:mm').format(requestTime);

                  return new Card(
                    child: new ListTile(
                      leading: new Padding(
                        padding: new EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: requestIcon,
                      ),
                      title: new Text(requestType),
                      subtitle: new Text(request['zipCode'] + ' - ' + timeStr),
                    ),
                  );
                }
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
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