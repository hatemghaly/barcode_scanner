import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:nice_button/nice_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"),
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        title: 'فحص الباركود',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'main',
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'قارىء الباركود '),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter, value = "";

  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.DEFAULT);
    setState(() {
      if (_counter == '-1') {
        _counter = "لقد قمت بعدم منح ترخيص استخدام الكاميرا";
      }
      value = _counter;
    });
  }

  customAboutUs(Icon icon, Text text) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        icon,
        SizedBox(
          height: 10,
        ),
        text,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
            child: Text(widget.title, style: TextStyle(fontFamily: 'main'))),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'نتيجة قارىء الباركود',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              value,
            ),
            SizedBox(
              height: 100,
            ),
            AnimatedButton(
              text: 'الباركود ',
              color: Colors.blue,
              width: 200,
              pressEvent: () {
                _incrementCounter();
              },
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedButton(
              text: 'عن المبرمج',
              color: Colors.blue,
              width: 200,
              pressEvent: () {
                AwesomeDialog(
                    context: context,
                    // dialogType: DialogType.INFO,
                    animType: AnimType.RIGHSLIDE,
                    headerAnimationLoop: false,
                    title: 'للتواصل مع المبرمج',
                    desc: 'الإسم : حاتم محمد أبو المعاطي غالي',
                    btnOkOnPress: () {},
                    body: Center(
                      child: Column(
                        children: [
                          customAboutUs(
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              Text(" حاتم محمد أبو المعاطي غالي")),
                          customAboutUs(
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            Text(" hatem.moham@gmail.com"),
                          ),
                          customAboutUs(
                            Icon(
                              Icons.mobile_screen_share,
                              color: Colors.blue,
                            ),
                            Text("00966568606393"),
                          )
                        ],
                      ),
                    ),
                    btnOkText: "موافق",
                    // btnOkIcon: Icons.cancel,
                    btnOkColor: Colors.blue)
                  ..show();
              },
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10.0),
            //   child: RaisedButton(
            //     color: Colors.red,
            //     padding: EdgeInsets.all(8.0),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: Icon(
            //             Icons.settings_overscan,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(2.0),
            //           child: Text(
            //             "الباركود",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10.0),
            //   child: RaisedButton(
            //     color: Colors.red,
            //     padding: EdgeInsets.all(8.0),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: Icon(
            //             Icons.event_note,
            //             color: Colors.white,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(2.0),
            //           child: Text(
            //             "عن المبرمج",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'قارىء الباركود',
      //   child: Icon(Icons.settings_overscan),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation
      //     .centerFloat // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
