import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:roumer/Localization.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isNotAbleShowDialog = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roumer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        JapaneseCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ja', 'JP'),
      ],
      locale: const Locale('ja', 'JP'),
      initialRoute: '/',
      routes: {
        '/': (context) => _StartPage(),
        '/home': (context) => _StartPage(),
      },
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}

class _StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<_StartPage> {
  @override
  Widget build(BuildContext context) {
    // _model.checkAuthention((hasAuthention) {
    //   if (hasAuthention) {
    //     //TODO
    //     Navigator.pushReplacementNamed(context, '/join_club');
    //   } else {
    //     Navigator.pushReplacementNamed(context, '/login');
    //   }
    // });

    Future(() {
      Navigator.pushReplacementNamed(context, '/archive');
    });

    return const Scaffold(
      body: Center(
        child: Text(
          "アプリ名",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
