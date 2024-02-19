import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  MyHomepage({super.key});

  final namecontroller = TextEditingController();
  final idcontroller = TextEditingController();
  final thirdcontroller = TextEditingController();
  final fourthcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My flutter college'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Name', border: OutlineInputBorder()),
              controller: namecontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Id', border: OutlineInputBorder()),
              controller: idcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'ProgramId', border: OutlineInputBorder()),
              controller: thirdcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'GPA', border: OutlineInputBorder()),
              controller: fourthcontroller,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      QuerySnapshot snapshot = await users.get();
                      int currentCount = snapshot.size;

                      // Increment the count to generate the next ID
                      int nextId = currentCount + 1;

                      await users.doc(nextId.toString()).set({
                        'Gpa': fourthcontroller.text,
                        'Name': namecontroller.text,
                        'Program_Id': thirdcontroller.text,
                        'Student_Id': idcontroller.text
                      }).then((value) => print('useradded'));
                      namecontroller.clear();
                      idcontroller.clear();
                      thirdcontroller.clear();
                      fourthcontroller.clear();
                    },
                    child: const Text('create'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Verify onPressed is called
                      print('Read button clicked');

                      // Retrieve the name from the controller
                      String name = namecontroller.text;
                      print('Name entered: $name'); // Verify Textfield Value

                      // Perform a query to fetch documents where the 'name' field matches the entered name
                      QuerySnapshot querySnapshot =
                          await users.where('Name', isEqualTo: name).get();

                      // Print query results
                      print(
                          'Number of documents retrieved: ${querySnapshot.docs.length}');

                      // Iterate through the documents
                      querySnapshot.docs.forEach((doc) {
                        var data = doc.data();
                        print('Type of data: ${data.runtimeType}');
                        print('Data: $data');
                      });
                      namecontroller.clear();
                      idcontroller.clear();
                      thirdcontroller.clear();
                      fourthcontroller.clear();
                    },
                    child: const Text('read'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Retrieve values from the text fields
                      String name = namecontroller.text;
                      String programId = thirdcontroller.text;
                      String studentId = idcontroller.text;
                      String newGpa = fourthcontroller.text;

                      // Perform a query to fetch documents where the 'Name', 'Program_Id', and 'Student_Id' fields match the entered values
                      QuerySnapshot querySnapshot = await users
                          .where('Name', isEqualTo: name)
                          .where('Program_Id', isEqualTo: programId)
                          .where('Student_Id', isEqualTo: studentId)
                          .get();

                      // Iterate through the documents
                      querySnapshot.docs.forEach((doc) async {
                        // Access the document reference
                        DocumentReference docRef = doc.reference;

                        // Update the 'Gpa' field to the new value
                        await docRef.update({'Gpa': newGpa});

                        print('Document updated successfully');
                      });
                      namecontroller.clear();
                      idcontroller.clear();
                      thirdcontroller.clear();
                      fourthcontroller.clear();
                    },
                    child: const Text('update'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Retrieve the name from the controller
                      String name = namecontroller.text;

                      // Perform a query to fetch documents where the 'Name' field matches the entered name
                      QuerySnapshot querySnapshot =
                          await users.where('Name', isEqualTo: name).get();

                      // Iterate through the documents
                      querySnapshot.docs.forEach((doc) async {
                        // Access the document reference
                        DocumentReference docRef = doc.reference;

                        // Delete the document
                        await docRef.delete();

                        print('Document deleted successfully');
                      });
                      namecontroller.clear();
                      idcontroller.clear();
                      thirdcontroller.clear();
                      fourthcontroller.clear();
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
