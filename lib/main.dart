import 'package:flutter/material.dart';
import 'package:flutter_notification1/model/apimodel.dart';
import 'package:http/http.dart' as http;

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
  final List<Notificationapi> _portfolio = [];
  @override
  void initState() {
    super.initState();

    fetchData().then((value) {
      setState(() {
        _portfolio.addAll(value);
      });
    });
  }

  Future<List<Notificationapi>> fetchData() async {
    List<Notificationapi> portfolio = [];
    // var portfolio = List<Portfolio>();
    var response = await http.post(
        'https://ea2ff247-76d0-4e6c-b2d4-f064625de830.mock.pstmn.io/sparkangelmock/NotificationHistoryRequest');

    //  var jsonPortfolio = await json.decode(response.body);

    var data = welcomeFromJson(response.body);

    portfolio = data.data.notifications;

    return portfolio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: const Text('Notifications'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.blue,
              onPressed: () {},
              child: const Text("MANAGE"),
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.transparent)),
            )
          ]),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            color: Colors.green[50],
            child: Card(
              color: Colors.green[50],
              child: ListTile(
                leading: const Icon(
                  Icons.account_box,
                  color: Colors.blue,
                  size: 50,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _portfolio[index].header,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _portfolio[index].descriptions.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(_portfolio[index].data.notifications[in].toString()),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Text(_portfolio[index].position),
                  ],
                ),
                trailing: Text(_portfolio[index].timeSent),
              ),
            ),
          );
        },
        itemCount: _portfolio.length,
      ),
    );
  }
}
