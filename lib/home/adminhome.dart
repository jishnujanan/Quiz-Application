import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/database/database.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  String question, op1, op2, op3, op4, ans;
  DatabaseServices databaseServices=new DatabaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Questions"),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Scrollbar(
        showTrackOnHover: true,
        thickness: 6,
        isAlwaysShown: true,
        radius: Radius.circular(4),
        hoverThickness: 4,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.04,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.width * 0.04,
              0),
          child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  onChanged: (value) => question = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field can't be null";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: "Enter the question?",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                TextFormField(
                  onChanged: (value) => op1 = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field can't be null";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Option1",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                TextFormField(
                  onChanged: (value) => op2 = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field can't be null";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Option2",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                TextFormField(
                  onChanged: (value) => op3 = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field can't be null";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Option3",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                TextFormField(
                  onChanged: (value) => op4 = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field can't be null";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Option4",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                DropdownButtonFormField(
                  validator: (value) => value==null ? "Field can't be null" : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                  focusColor: Colors.black,
                  hint: Text("Select correct option"),
                  onChanged: (value) => ans=value,
                  items: [
                    DropdownMenuItem(child: Text("A"),value: "A",),
                    DropdownMenuItem(child: Text("B"),value: "B",),
                    DropdownMenuItem(child: Text("C"),value: "C",),
                    DropdownMenuItem(child: Text("D"),value: "D",),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                MaterialButton(
                    onPressed: () async{
                      if (_formkey.currentState.validate()) {
                        print("Before making json");
                        dynamic data = {
                          "question": question,
                          "A": op1,
                          "B": op2,
                          "C": op3,
                          "D": op4,
                          "ans": ans,
                        };
                        dynamic result=await databaseServices.upload(data);
                        result == null ? SnackBar(
                          content: const Text('Something went wrong!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ) : SnackBar(
                          content: const Text('Succesfully added!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        _formkey.currentState.reset();
                      } else {
                        print("Invalid form");
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
