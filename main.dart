import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: 'Task-11 Project',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

//void main() {
//runApp(MyApp());
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// ignore: must_be_immutable
class _MyAppState extends State<MyApp> {
  get accentHexColor => null;

//class MyApp extends StatelessWidget {
  //late String cmd;

  web() async {
    var url = Uri.http("3.109.60.246", "/cgi-bin/command.py", {"x": cmd});
    var response = await http.get(url);
    setState(() {
      _res = response.body;
    });

    print(response.body);
    print(cmd);

    print(_res);
  }

  TextEditingController _heightController = TextEditingController();
  late String _res = "";
  late String _output = "";
  late String cmd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: web,
          child: Icon(Icons.check_box),
        ),
        appBar: AppBar(
          title: Text("Dockinux App"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.account_box),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://icon-library.com/images/docker-container-icon/docker-container-icon-15.jpg")),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 290,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      onChanged: (value) {
                        cmd = value;
                      },
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.computer,
                              size: 35.0, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(15.0))),
                        hintText: "Enter ur Command.... ",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: web,
                child: Container(
                  child: Text(
                    "Run",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "$_res", //toStringAsFixed(2),
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _output.isNotEmpty,
                  child: Container(
                    child: Text(
                      _output,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
