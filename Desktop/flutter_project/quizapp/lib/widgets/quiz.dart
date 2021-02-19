import 'dart:html';
import 'package:flutter/material.dart';
import 'package:testproject/model/Quizquestion.dart';
import 'package:http/http.dart';

class quiz extends StatefulWidget {
  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {

  Quizquestion quizquestion;

  @override
  void initState() {
    super.initState();
    fetchDetailFromId(widget.info).then((value) =>
    {
      setState(() {
        quizquestion = value;
      })
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,),
        body:
        quizquestion != null ?
        SingleChildScrollView(
          child: Column(
            children: [
              Text(quizquestion.category),
              SizedBox(height: 10,),
              Text(quizquestion.type),
              SizedBox(height: 10,),
              Text(quizquestion.difficulty),
              SizedBox(height: 20,),
              Text(quizquestion.question),
              SizedBox(height: 10,),
              Text(quizquestion.correctAns),
              SizedBox(height: 10,),
              Text(quizquestion.incorrectAns),
            ],
          ),
        )

    );
  }

  Future<Quizquestion> fetchDetailFromId(question) async {
    final response = await http.get(
        'https://opentdb.com/api.php?amount=10');

    if (response.statusCode == 200) {
      print(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Quizquestion.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,

      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
