import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black87),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(
          0xFFFFFFFF,
          const <int, Color>{
            50: const Color(0xFFFFFFFF),
            100: const Color(0xFFFFFFFF),
            200: const Color(0xFFFFFFFF),
            300: const Color(0xFFFFFFFF),
            400: const Color(0xFFFFFFFF),
            500: const Color(0xFFFFFFFF),
            600: const Color(0xFFFFFFFF),
            700: const Color(0xFFFFFFFF),
            800: const Color(0xFFFFFFFF),
            900: const Color(0xFFFFFFFF),
          },
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  late FocusNode myFocusNode;
  late bool selected;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    selected = false;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
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
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(41.8758, -87.6189),
            zoom: 15.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
          ],
        ),
        Positioned(
            left: 20,
            top: 20,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text('OpenStreetMap'),
              icon: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Openstreetmap_logo.svg/1024px-Openstreetmap_logo.svg.png',
                  height: 30),
            )),
        Positioned(
            right: 20,
            top: 20,
            child: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.menu))),
        Positioned(
          left: 20,
          top: 90,
          child: Material(
              type: MaterialType.canvas,
              shape: StadiumBorder(),
              elevation: 6,
              child: Container(
                  width: 187.5,
                  height: 48,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 0),
                    child: TextField(
                      cursorColor: Colors.black,
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                          labelText: 'Search',
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          isDense: true,
                          alignLabelWithHint: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0.0)),
                      //style: TextStyle(: 5),
                    ),
                  ))),
        ),
        Positioned(
            left: 15,
            bottom: 15,
            child: FloatingActionButton(
              child: Icon(Icons.my_location),
              onPressed: () {},
            )),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(17.5),
          child: FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.copyright),
              label: Text('OpenStreetMap contributors')),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }
}
