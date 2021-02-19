import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Center(
            child: Text(
              "Home",
              style: TextStyle(color: Colors.black),),
          ),
          backgroundColor: Colors.white,),
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/anak2u.png",height: 400,width: 600,),
              Text("Press button bellow to start")
            ],

          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
          },
          label: Text("Start Now"),)
    );
  }

}

