import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _appImage = AssetImage("images/standard.png");
  var _mensage = "Chose the option below";

  void _selectedOption(String userChoice){

    var options = ["stone", "paper", "scissor"];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    print("App choice: " + appChoice);

    print("User choice: " + userChoice);


    // Display of the image chosen by the app
    switch( appChoice ){
      case "stone" :
        setState(() {
          this._appImage = AssetImage("images/stone.png");
        });
        break;
      case "paper" :
        setState(() {
          this._appImage = AssetImage("images/paper.png");
        });
        break;
      case "scissor" :
        setState(() {
          this._appImage = AssetImage("images/scissor.png");
        });
        break;
    }

    // Winner validation
    // Winner user
    if(
    (userChoice == "stone" && appChoice == "scissor") ||
        (userChoice == "scissor" && appChoice == "paper") ||
            (userChoice == "paper" && appChoice == "stone")
    ){
      setState(() {
        this._mensage = "Congratulations!!! You have won :)";
      });

      // Winner App
    } else if (
    (appChoice == "stone" && userChoice == "scissor") ||
        (appChoice == "scissor" && userChoice == "paper") ||
           (appChoice == "paper" && userChoice == "stone")
    ){
      setState(() {
        this._mensage = "You lose :(";
      });
    }else{
      setState(() {
        this._mensage = "We stall ;)";
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "App Choice",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._appImage,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedOption("stone") ,
                child: Image.asset("images/stone.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("paper") ,
                child: Image.asset("images/paper.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("scissor") ,
                child: Image.asset("images/scissor.png", height: 100,),
              )
            ],
          )
        ],
      ),
    );
  }
}
