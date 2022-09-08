import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  int? cnt;

  bool status = false;
  SharedPreferences? prefs;


  @override
  void initState() {
    super.initState();
    initpref();

  }

  initpref() async {
    prefs = await SharedPreferences.getInstance();
    cnt = prefs!.getInt("abc") ?? 0;
    status = true;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sherd Prefence")),
      body: status ? Column(
        children: [
          Center(
            child: Container(
              child: Text("$cnt"),
            ),
          ),
          Center(
            child: Container(
              child: ElevatedButton(onPressed: () async {

                setState(() {
                  cnt = cnt! + 1;
                });
                await prefs!.setInt("abc", cnt!);


              }, child: Text("Incriment")),
            ),
          ),

        ],
      ) : Center(child: CircularProgressIndicator()),

    );
  }
}
