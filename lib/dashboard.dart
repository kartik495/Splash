import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List items = [];
  int limit = 10;

  void getData() async {
    var queryParameters = {
      'offset': '0',
      'limit': '$limit',
    };
    final url = 'playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com';
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjE1NjYxMzA3LCJqdGkiOiI3ZTcwMGZmODNhYjU0NTI4YTc1YTE3NGJiMzFiYTc2MyIsInVzZXJfaWQiOjEsInVzZXJuYW1lIjoiYWIifQ.z0moeqzLon9gdhpz0Tu8FxULct9Hz3db76zL6rmmXNY';

    var uri =
        new Uri.http(url, 'api/v1/establishment/test/list', queryParameters);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    var res = json.decode(response.body);
    print(res);
    setState(() {
      for (int i = 0; i < res.length; i++) {
        items.add(res[i]);
      }
      print(items);
    });
  }

  Widget CustomCard(Map data) {
    String a = data['dayOfWeeksOpen'].toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['name'],
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Created On: ${data['createOn']}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'updated On: ${data['updatedOn']}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ID: ${data['id']}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Day of Week Open: ${a.substring(1, a.length - 1)}'),
                  )
                ],
              )),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: ListView(
          children: items.map((e) => CustomCard(e)).toList(),
        ),
      ),
    );
  }
}
