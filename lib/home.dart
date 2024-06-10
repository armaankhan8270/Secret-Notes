import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/add_notes.dart';
import 'package:secret_notes/data.dart';
import 'package:secret_notes/login.dart';
import 'package:secret_notes/notes_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secret_notes/subject.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> listOfData = [];
  Set<Map<String, dynamic>> listOfDataaa = {};
  @override
  void initState() {
    print("refresh");
    super.initState();
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('notes').get();
      int count = 0;

      if (querySnapshot.docs.isNotEmpty) {
        // Clear the list before populating it to avoid duplicates
        setState(() {
          listOfData.clear();
        });

        // Iterate through the documents and add data to the list
        querySnapshot.docs.forEach((document) {
          if (count > 5) {
            return;
          }
          count++;

          listOfData.add(document.data() as Map<String, dynamic>);
        });
      }
    } catch (e) {
      // Handle any errors here
      print('Error: $e');
    }
  }

  Future<void> searchData() async {
    try {
      CollectionReference collectionReference1 =
          FirebaseFirestore.instance.collection('notes');
      QuerySnapshot querySnapshot1 = await collectionReference1
          .where("subject",
              isEqualTo: searchController.text.trim().toLowerCase())
          .get();
      print(querySnapshot1.docs);

      if (querySnapshot1.docs.isNotEmpty) {
        setState(() {
          listOfData.clear();
        });
        int count = 0;
        querySnapshot1.docs.forEach((doc) {
          count++;
          if (count > 3) {
            return;
          }
          // Access data from each document
          listOfData.add(doc.data() as Map<String, dynamic>);
          // print("${searchController.text.trim().toLowerCase()} is pressed 4");
          // print(doc.data());
        });
        setState(() {});
      }
    } catch (e) {
      // Handle any errors here
      print('Error: $e');
    }
  }

  Future<void> searchData2() async {
    try {
      String queryTitle = searchController.text.trim();
      print("$queryTitle is pressed");

      // Clear the list before performing a new search
      setState(() {
        listOfData.clear();
      });

      CollectionReference collectionReference1 =
          FirebaseFirestore.instance.collection('notes');
      print("$queryTitle is pressed1");

      // Query Firestore to fetch data where the title contains the keyword
      QuerySnapshot querySnapshot1 = await collectionReference1
          .where("subject",
              //     isEqualTo: searchController.text.trim().toLowerCase())
              // .where(
              //   "title",
              isEqualTo: queryTitle)
          .get();

      print(querySnapshot1.docs);

      if (querySnapshot1.docs.isNotEmpty) {
        print("$queryTitle is pressed 2");
        querySnapshot1.docs.forEach((doc) {
          // Access the title from each document
          String title = (doc.data() as Map<String, dynamic>)['title']
              .toString()
              .toLowerCase();

          // Check if the lowercase title contains the query keyword
          if (title.contains(queryTitle)) {
            listOfData.add(doc.data() as Map<String, dynamic>);
          }
        });
        setState(() {});
      }
    } catch (e) {
      // Handle any errors here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, String>> contentList = data;

    // Initialize an empty list

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Row(
              children: [
                Text(
                  "TheNotes",
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900),
                ),
                const Spacer(),
                // Icon(
                //   Icons.menu_book_rounded,
                //   size: 32,
                //   color: Colors.grey.shade900,
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(
                          headerImage:
                              "https://img.freepik.com/premium-vector/login-form-page-with-lock-password-safety-verification-user-authorization-web-security-concept-3d-vector-icon-cartoon-minimal-style_365941-820.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
                          title: "Login",
                        ),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.network(
                      'https://img.freepik.com/premium-photo/cute-happy-male-teacher-white-background-ai-generated_971652-235.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais',
                      height: 70,
                      width: 50,
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddNotes(),
                        ),
                      );
                    },
                    child: Image.network(
                      "https://img.freepik.com/free-vector/3d-cartoon-style-checklist-with-pen-icon-curved-sheet-paper-list-with-completed-tasks-flat-vector-illustration-time-management-planning-organization-concept_778687-984.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
                      height: 60,
                      width: 60,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      controller: searchController,
                      style: GoogleFonts.poppins(color: Colors.grey.shade900),
                      decoration: InputDecoration(
                        hintText: "What are you looking for",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () {
                            // Add your action here
                            searchData();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubjectScreenn(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'All topics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 20),
            //   decoration: BoxDecoration(
            //     // gradient: LinearGradient(
            //     //   colors: [Colors.blue.shade300, Colors.grey.shade300],
            //     //   begin: Alignment.centerLeft,
            //     //   end: Alignment.centerRight,
            //     // ),
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {
            //           // Add your action here for Button 3
            //         },
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.blue, // Button background color
            //           onPrimary: Colors.white, // Text color
            //           elevation: 5, // Button shadow
            //           shape: RoundedRectangleBorder(
            //             borderRadius:
            //                 BorderRadius.circular(10), // Rounded corners
            //           ),
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 20, vertical: 12), // Padding
            //         ),
            //         child: Text(
            //           'ADD notes +  ',
            //           style: TextStyle(
            //             fontSize: 18, // Text size
            //             fontWeight: FontWeight.bold, // Text weight
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: listOfData.length,
                itemBuilder: (context, index) {
                  return NotesCard(
                    topic: listOfData[index]["subject"] as String,
                    title: listOfData[index]["title"] as String,
                    content: listOfData[index]["content"] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class Cimage extends StatelessWidget {
//   const Cimage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Image.network(
//           'https://img.freepik.com/premium-psd/isolated-realistic-matte-blue-sport-city-suv-car-from-left-front-view_16145-4922.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais'),
//     );
//   }
// }

// class C1 extends StatelessWidget {
//   const C1({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       margin: const EdgeInsets.only(top: 220),
//       width: double.infinity,
//       // height: 300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//       ),
//       child: Text(
//         "This is The car",
//         style: GoogleFonts.poppins(
//             fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//     );
//   }
// }
