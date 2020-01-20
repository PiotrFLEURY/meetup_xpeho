import 'package:flutter/material.dart';
import 'package:meetup_xpeho/edit_member.dart';
import 'package:meetup_xpeho/image_provider.dart';
import 'package:meetup_xpeho/splash.dart';
import 'package:meetup_xpeho/team.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPEHO Meetup',
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(color: Colors.teal)),
      initialRoute: '/splash',
      routes: {
        //"/": (context) => MyHomePage(title: 'Meetup XPEHO Demo Home Page'),
        "/splash": (context) => SplashPage(),
        "/team": (context) => TeamPage(),
        "/editMember": (context) => EditMemberPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the plus button this many times:',
            ),
            Text(
              '$_counter',
              key: Key('counter'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
