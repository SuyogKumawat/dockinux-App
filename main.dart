import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  web() async {
    var url = Uri.http("13.126.173.30", "/cgi-bin/command.py", {"x": cmd});
    var response = await http.get(url);
    print(response.body);
    //print(x);
  }

  late String cmd;

  lw() {
    print("clicked me....");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: lw,
          child: Icon(Icons.accessible),
        ),
        appBar: AppBar(
          title: Text("Dockinux App"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: lw,
              icon: Icon(Icons.account_box),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png")),
                  border: Border.all(color: Colors.blueAccent, width: 10)),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Enter yr command:"),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              autocorrect: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.print),
                  hintText: "enter command"),
            ),
            TextButton(
              onPressed: web,
              child: Text("Clicked cmd"),
            ),
          ],
        ),
      ),
    );
  }
}
