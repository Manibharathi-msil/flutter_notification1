import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/portfolio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Portfolio> _portfolio = [];
  @override
  void initState() {
    fetchData().then((value) {
      _portfolio.addAll(value);
    });
  }

  Future<List<Portfolio>> fetchData() async {
    List<Portfolio> portfolio = [];
    // var portfolio = List<Portfolio>();
    var response = await http.get('https://mock-json-service.glitch.me');
    var jsonPortfolio = json.decode(response.body);
    setState(() {
      portfolio = jsonPortfolio
          .map<Portfolio>((json) => new Portfolio.fromJson(json))
          .toList();
    });
    return portfolio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text('Notifications'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.blue,
              onPressed: () {},
              child: Text("MANAGE"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            )
          ]),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            color: Colors.green[50],
            child: Card(
              color: Colors.green[50],
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 50,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _portfolio[index].company,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(_portfolio[index].description),
                    SizedBox(
                      height: 5,
                    ),
                    Text(_portfolio[index].position),
                  ],
                ),
                trailing: Text(_portfolio[index].location),
              ),
            ),
          );
        },
        itemCount: _portfolio.length,
      ),
    );
  }
}
