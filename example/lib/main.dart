import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'gl_script.dart' show glScript;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 var _data1 = [

  ];


  getData1() async {
    await Future.delayed(const Duration(milliseconds: 100));

     var dataObj = [
      [3, 2, 32],
      [1.5, 2.2, 3.5],
      [2, 2.5, 4],
      [2, 2.5, 4],
      [2.5, 3, 4.5],
      [2, 2.5, 4],
      [2.5, 3, 4.5],
      [21, 2.5, 4],
      [22, 2.5, 4],
      [23.5, 3, 4.5],  [21, 2.5, 4],
      [22, 2.5, 4],
      [23.5, 3, 4.5],  [21, 2.5, 4],
      [22, 2.5, 4],
      [23.5, 3, 4.5],
      [21, 2.5, 4],
      [22, 2.5, 4],
      [23.5, 3, 4.5],
      [22, 2.5, 4],
      [24.5, 3, 4.5],
       [21, 5.5, 4],
       [22, 2.5, 4],
       [4.5, 3, 4.5],  [21, 2.5, 4],
       [2, 2.5, 4],
       [3.5, 5, 4.5],  [21, 2.5, 4],
       [22, 2.5, 4],
       [23.5,2, 4.5],

    ];

    setState(() {
      _data1 = dataObj;
    });
  }

  @override
  void initState() {
    super.initState();

    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Echarts Demon'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text('Reactive updating and tap event',
                    style: TextStyle(fontSize: 20)),
              ),
              const Text('- data will be fetched in a few seconds'),
              const Text('- tap the bar and trigger the snack'),

              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text('Using WebGL for 3D charts',
                    style: TextStyle(fontSize: 20)),
              ),
              const Text('- chart capture all gestures'),
              SizedBox(
                width: 300,
                height: 250,
                child: Echarts(
                  extensions: const [glScript ],
                  captureAllGestures: true,
                  option: ''' {
                

      xAxis3D: {
      type: 'value'
    },
    yAxis3D: {
      type: 'value'
    },
    zAxis3D: {
      type: 'value'
    },
    grid3D: {
      viewControl: {
        // projection: 'orthographic'
      }
    },
    series: [
     {
    type: 'surface',
    wireframe: {
      // show: false
    },
    data: 
     $_data1
    
  }
    ]
                    }

                  ''',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),

                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {

                    setState(() {
                      getData1();
                    });
                  },
                  child: Container(color: Colors.black26,padding: const EdgeInsets.all(8.0) ,
                      child: Text('Get Data',style: TextStyle(fontSize: 30),)),
                ),
              )

            ],

          ),
        ),
      ),
    );
  }
}
