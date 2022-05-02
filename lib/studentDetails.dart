import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:husaini/viewStudent.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentDetails> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StudentDetails> {
  // final Stream<QuerySnapshot> studentstream =
  //     FirebaseFirestore.instance.collection('students').snapshots();
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream: studentstream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         print('Something went wrong');
    //       }
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }

    //       final List storedocs = [];
    //       snapshot.data!.docs.map((DocumentSnapshot document) {
    //         Map a = document.data() as Map<String, dynamic>;
    //         storedocs.add(a);
    //       }).toList();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(ViewStudent(title: 'IEC HUSAINI'));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('IEC HUSAINI'),
        ),
        body: Column(children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'IEC YOUTH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
              Image.asset(
                'images/logo.png',
                height: 80,
              )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              //color: Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset('images/logo.png'),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    'Parent Name:',
                    style: TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    'Phone Number:',
                    style: TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    'Email Address:',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'waris',
                    style: const TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    'kamran',
                    style: const TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    '+92 302 2776195',
                    style: const TextStyle(fontSize: 18),
                  ),
                  space(),
                  const Text(
                    'waris@gmail.com',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          )
        ]));
    //});
  }
}

Widget space() {
  return const SizedBox(
    height: 30,
  );
}
