import 'package:flutter/material.dart';
import 'package:quiz/home/user.dart';

import 'adminhome.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => User(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.person), Text("User")],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminHome(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.vpn_key), Text("Admin")],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      //child:
      /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    admin = false;
                    setState(() {});
                  },
                  child: Text(
                    'Join as User',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                MaterialButton(
                  onPressed: () {
                    admin = true;
                    setState(() {});
                  },
                  child: Text(
                    'Join as Admin',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                admin == true
                    ? Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: Container(
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (value)
                              {
                                print(value);
                                if(value == "2001")
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
                                }
                                else if(value.length > 4 ) {
                                  final snackBar = SnackBar(
                                  content: const Text('Invalid PIN!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                counterStyle: TextStyle(color: Colors.white),
                                  hintText: "Enter the pin",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)),
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder()),
                            ),

                          ],
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),*/
    );
  }
}
