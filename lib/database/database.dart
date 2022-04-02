import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  Future<dynamic> upload(Map<String, String> data) async {
    try {
      await FirebaseFirestore.instance.collection("questions").doc().set(data);
      return 'succesfull';
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> load() async {
    Map question={};
    List quiz=[];
    try {
      int i = 0;
      dynamic result = await FirebaseFirestore.instance
          .collection("questions")
          .get()
          .then((value) {
            int len=value.size;
        while(i<len)
          {
            quiz.insert(i, {
              "question":value.docs[i]["question"],
              "A":value.docs[i]["A"],
              "B":value.docs[i]["B"],
              "C":value.docs[i]["C"],
              "D":value.docs[i]["D"],
              "ans":value.docs[i]["ans"],
            });
            i++;
          }
      });
      print(quiz.length);
      return quiz;
    } catch (e) {
      return null;
    }
  }
}


/*
i++;
*/
