import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:quizappp/model/quizQuestion.dart';
import 'dart:convert';


      class QuizPage extends StatefulWidget {
        @override
        _QuizPageState createState() => _QuizPageState();
          }

      class _QuizPageState extends State<QuizPage> {

        Quizquestion quizquestion;

        @override
              void initState() {
                super.initState();
                fetchDetailFromId().then((value) =>
                {
                  setState(() {
                    quizquestion = value;
                  })
                });
                }

        Widget build(BuildContext context) {
              return Scaffold(
                  appBar: AppBar(title:Text("Quiz")),
              body:
              quizquestion != null?
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
                  : CircularProgressIndicator()
              );
           }



            Future<List<Quizquestion>> fetchQuestion() async {
              final response = await http.get(
                  'https://opentdb.com/api.php?amount=10');

              if (response.statusCode == 200) {

                print(response.body);
                // If the server did return a 200 OK response,
                // then parse the JSON.
                return add(Quizquestion.fromJson(jsonDecode(response.body)));

              }
              else {
                // If the server did not return a 200 OK response,

                // then throw an exception.
                throw Exception('Failed to load question');
              }
            }


          )
       }



