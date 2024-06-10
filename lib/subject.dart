import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/card_subject.dart';
import 'package:secret_notes/home.dart';
import 'package:secret_notes/show_subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectScreenn extends StatefulWidget {
  const SubjectScreenn({Key? key}) : super(key: key);

  @override
  State<SubjectScreenn> createState() => _SubjectScreennState();
}

class _SubjectScreennState extends State<SubjectScreenn> {
  String query = "urdu";
  List<String> subjects = [
    'ai',
    'nlp',
    'urdu',
    'bigdata',
    "Physics",
    "Biology",
    "English Literature",
    "History",
    "Chemistry",
    "Computer Science",
    "Environmental Science",
    "Mathematics",
    "Foreign Language",
    "Art",
    "Geography",
    "Psychology",
    "Science",
    "Music",
    "Philosophy",
    "Engineering",
    "Social Science",
    "Geology",
    "Drama",
  ];
  List<Map<String, dynamic>> listOfData = [
    {
      "title": "Mathematics Education",
      "subject": "mathematics",
      "img": "education.jpg",
      "content":
          "Mathematics education is essential for developing critical thinking skills and problem-solving abilities, starting from early childhood."
    }
  ];
  Future searchData(String text) async {
    try {
      int count = 0;

      CollectionReference collectionReference1 =
          FirebaseFirestore.instance.collection('notes');

      // Query Firestore to fetch data
      QuerySnapshot querySnapshot1 = await collectionReference1
          .where('subject', isGreaterThanOrEqualTo: text)
          .where('subject', isLessThan: text + 'z')
          .where('subject'.toLowerCase().trim(), isEqualTo: text)
          .get();
      if (querySnapshot1.docs.isNotEmpty) {
        setState(() {
          listOfData.clear();
        });

        querySnapshot1.docs.forEach((doc) {
          count++;
          if (count > 5) {
            return;
          }
          // Access data from each document
          listOfData.add(doc.data() as Map<String, dynamic>);

          print(doc.data());
        });

        // Navigate to OneSubjectScreen after data is fetched
        setState(() {});
      }
    } catch (e) {
      // Handle any errors here
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Access widget properties or perform layout-related tasks here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.grey.shade300],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                // margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-psd/books-icon-isolated-3d-render-illustration_47987-7695.jpg?w=740&t=st=1695750575~exp=1695751175~hmac=95d6f13957e84420f8047b7d82bcf4ed39df85efb8af1e1069676d458b50eeec",
                      height: 50,
                      width: 80,
                    ),
                    Text(
                      "All Subjects",
                      style: GoogleFonts.croissantOne(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       await searchData(listOfData[0]['subject']);
              //     },
              //     child: Text(
              //       "gooo",
              //       style: TextStyle(color: Colors.black),
              //     )),
              for (int i = 0; i < subjects.length; i++)
                SubjectCard(
                  onPressed: () async {
                    await searchData(i >= 0 ? subjects[i] : "armaan");
                  },
                  listOfData: listOfData,
                  text: i >= 0 ? subjects[i] : "armaan",
                ),
            ],
          ),
        ),
      ),
    );
  }

//   SubjectCard(String text) {
//     return Container(
//       child: GestureDetector(
//         onTap: () async {
//           print(text);
//           await searchData(query);
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OneSubjectScreen(listOfData: listOfData),
//             ),
//           );
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //       builder: (context) => OneSubjectScreen(listOfData: listOfData)),
//           // );)
//           // );
//           print("pressd $text");
//         },
//         child: Container(
//           width: double.infinity,
//           height: 100,
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Row(
//             children: [
//               Image.asset(
//                 "images/1.jpeg",
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               Text(
//                 text,
//                 style: GoogleFonts.croissantOne(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 31,
//                     color: Colors.white),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
