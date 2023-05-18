import 'package:flutter/material.dart';

import 'MyProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String search = '';
  TextEditingController searchController = TextEditingController();
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
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyProfile()))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  controller: searchController,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      search = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search for anything',
                      border: OutlineInputBorder())),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    late String position = index.toString();
                    if (searchController.text.isEmpty) {
                      return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrw3_sLefMmeexGoKh9eTT-213DNvhV1O06jo7VdRlDQlS__L3DIOGbwMV9FRmyKtu9ODGoc-_l1U&usqp=CAU&ec=48600113"),
                          ),
                          title: Text("John wick $index"),
                          subtitle: const Text("This is my last message "));
                    } else if (position
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrw3_sLefMmeexGoKh9eTT-213DNvhV1O06jo7VdRlDQlS__L3DIOGbwMV9FRmyKtu9ODGoc-_l1U&usqp=CAU&ec=48600113"),
                          ),
                          title: RichText(
                              text: TextSpan(
                                  text: "John Wick ",
                                  children: <TextSpan>[
                                TextSpan(
                                    text: index.toString(),
                                    style: TextStyle(color: Colors.red))
                              ])),
                          subtitle: const Text("This is my last message "));
                    } else {
                      return Container();
                    }
                  },
                  itemCount: 5000,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
