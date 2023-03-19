import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter in app POPUP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Create a rate my app object that customizes the conditions of the popup

  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    remindDays: 4,
    remindLaunches: 4,
// appStoreIdentifier: "",
// googlePlayIdentifier: "",
  );

// ask for rating promt
  @override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
// check if the dialouge should be opened
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(
          context,
          title: "are you enjoying the difference?",
          message: "please leave us a review!",
          rateButton: 'RATE',
          noButton: 'NO THANKS',
          laterButton: 'MAYBE LATER',
          onDismissed: () =>
              RateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
