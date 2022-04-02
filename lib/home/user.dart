import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz/database/database.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List quiz;
  bool finished = false;
  int randomquestion;
  @override
  void initState() {
    // TODO: implement initState
    getquiz();
    super.initState();
  }

  Future getquiz() async {
    DatabaseServices _dbservices = DatabaseServices();
    quiz = await _dbservices.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(finished);
    if (quiz != null && quiz.isNotEmpty) {
      var questionNumber = new Random();
      randomquestion = questionNumber.nextInt(quiz.length);
      print("the random question number is ${randomquestion}");
    }
    return quiz == null || quiz.isEmpty
        ? Scaffold(
            body:finished ? Center(child: Text("You Completed the quiz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),) : Center(
              child: CircularProgressIndicator(
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
            ),
            body: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      quiz[randomquestion]['question'],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      elevation: 18.0,
                      color: Colors.blue,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                        onPressed: () {
                          if (quiz[randomquestion]["ans"] == "A") {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Correct Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/correct-tick.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Sorry Wrong Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/bouncy-fail.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          }
                          //
                          quiz.removeAt(randomquestion);
                          var questionNumber = new Random();

                          if (quiz.isEmpty) {
                            finished = true;
                          } else {
                            randomquestion =
                                questionNumber.nextInt(quiz.length);
                          }
                          setState(() {});
                        },
                        minWidth: 200.0,
                        height: 35,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            quiz[randomquestion]['A'],
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      elevation: 18.0,
                      color: Colors.blue,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                        onPressed: () {
                          if (quiz[randomquestion]["ans"] == "B") {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Correct Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/correct-tick.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Sorry Wrong Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/bouncy-fail.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          }
                          //
                          quiz.removeAt(randomquestion);
                          var questionNumber = new Random();
                          if (quiz.isEmpty) {
                            finished = true;
                          } else {
                            randomquestion =
                                questionNumber.nextInt(quiz.length);
                          }
                          setState(() {});
                        },
                        minWidth: 200.0,
                        height: 35,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            quiz[randomquestion]['B'],
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      elevation: 18.0,
                      color: Colors.blue,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                        onPressed: () {
                          if (quiz[randomquestion]["ans"] == "C") {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Correct Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/correct-tick.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Sorry Wrong Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/bouncy-fail.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          }
                          //
                          quiz.removeAt(randomquestion);
                          var questionNumber = new Random();
                          if (quiz.isEmpty) {
                            finished = true;
                          } else {
                            randomquestion =
                                questionNumber.nextInt(quiz.length);
                          }
                          setState(() {});
                        },
                        minWidth: 200.0,
                        height: 35,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            quiz[randomquestion]['C'],
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      elevation: 18.0,
                      color: Colors.blue,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                        onPressed: () {
                          if (quiz[randomquestion]["ans"] == "D") {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Correct Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/correct-tick.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Sorry Wrong Answer'),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        child: Image.asset(
                                            "assets/bouncy-fail.gif"),
                                      ),
                                      actions: [
                                        FlatButton(
                                          textColor: Color(0xFF6200EE),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Next'),
                                        ),
                                      ],
                                    ));
                          }
                          //
                          quiz.removeAt(randomquestion);
                          var questionNumber = new Random();
                          if (quiz.isEmpty) {
                            finished = true;
                          } else {
                            randomquestion =
                                questionNumber.nextInt(quiz.length);
                          }
                          setState(() {});
                        },
                        minWidth: 200.0,
                        height: 35,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            quiz[randomquestion]['D'],
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
