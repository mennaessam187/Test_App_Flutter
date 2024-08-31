import 'package:flutter/rendering.dart';

import 'appBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

appbrain q1 = new appbrain();
String emoj1 = "\u{1F973}";
String emoj2 = "\u{1F625}";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 77, 78, 83),
          title: const Text(
            "Your Test",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(216, 230, 249, 1),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: myexamapp(),
        ),
      ),
    );
  }
}

class myexamapp extends StatefulWidget {
  const myexamapp({super.key});

  @override
  State<myexamapp> createState() => _myexamappState();
}

int rightAnswer = 0;

class _myexamappState extends State<myexamapp> {
  void checktheanswer(bool value) {
    if (q1.gitcorrectanswer() == value) {
      rightAnswer++;
      icons1.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.thumb_up,
          color: Colors.green,
        ),
      ));
    } else {
      icons1.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.thumb_down,
          color: Colors.red,
        ),
      ));
    }
    if (q1.isFinshed() == true) {
      Alert(
        context: context,
        title: "Test is Finish",
        desc: lastResult(),
        buttons: [
          DialogButton(
            child: Text(
              "Start Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(60, 117, 192, 1),
            radius: BorderRadius.circular(18),
            width: 120,
          )
        ],
      ).show();
      q1.reset();
      icons1 = [];
      rightAnswer = 0;
    } else {
      q1.increace();
    }
  }

  String lastResult() {
    if (rightAnswer >= 5) {
      return "Your answer ($rightAnswer/7)$emoj1";
    } else
      return "Your answer ($rightAnswer/7)$emoj2";
  }

  List<Widget> icons1 = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: icons1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Expanded(
            flex: 3,
            child: Image(
              image: AssetImage(q1.gitimage()),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 3,
          child: Text(
            q1.gitText(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
              color: Colors.indigo,
              minWidth: 350,
              onPressed: () {
                setState(() {
                  checktheanswer(true);
                });
              },
              child: const Text(
                "True",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white),
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: MaterialButton(
            color: Colors.red,
            minWidth: 350,
            onPressed: () {
              setState(() {
                checktheanswer(false);
              });
            },
            child: const Text(
              "False",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
