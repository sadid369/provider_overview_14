// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_14/counter.dart';
import 'package:provider_overview_14/show_me_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Counter _counter = Counter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonymous Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   "/": (context) => ChangeNotifierProvider.value(
      //         value: _counter,
      //         child: MyHomePage(),
      //       ),
      //   "/counter": (context) => ChangeNotifierProvider.value(
      //         value: _counter,
      //         child: ShowMeCounter(),
      //       ),
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                      value: _counter,
                      child: MyHomePage(),
                    ));

          case "/counter":
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                      value: _counter,
                      child: ShowMeCounter(),
                    ));
          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: Text(
                "Show Me Counter",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: Text(
                "Increment Counter",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
