import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String data = 'hello';
  String pressedData = 'hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(appBar: AppBar())));
                },
                icon: Icon(Icons.fork_right))
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (v) {
                setState(() {
                  data = v;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint('this has been clicked');
                  setState(() {
                    pressedData = controller.text;
                  });
                },
                child: Text('Add')),
            Text(controller.text),
            Text(data),
            Text(pressedData)
          ],
        ));
  }
}
