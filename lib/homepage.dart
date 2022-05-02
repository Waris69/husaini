//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:husaini/addStudent.dart';
import 'package:husaini/viewStudent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> studentstream =
      FirebaseFirestore.instance.collection('students').snapshots();
  // static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // static final CollectionReference = _firestore.collection("students");
  // static final DocumentReference = CollectionReference.doc("stu1");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentstream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            // ignore: avoid_print
            print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 60,
                width: 60,
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('IEC HUSAINI'),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'IEC YOUTH',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                const Text(
                  'DASHBOARD',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: _addStudent(),
                      onTap: () {
                        Get.to(const AddStudent(title: 'IEC HUSAINI'));
                      },
                    ),
                    GestureDetector(
                        child: _viewStudent(),
                        onTap: () {
                          Get.to(const ViewStudent(title: 'IEC HUSAINI'));
                        }),
                  ],
                ),
                const SizedBox(
                  height: 120.0,
                ),
                Opacity(
                    opacity: 0.1,
                    child: Image.asset('images/logo.png', height: 170.00)),
              ],
            ),
          );
          // });
        });
  }

  Widget _addStudent() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        height: 150,
        width: 150,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 50,
              ),
              Text('Add Student',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ]),
      ),
    );
  }

  Widget _viewStudent() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        height: 150,
        width: 150,
        //color: Colors.blue,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.remove_red_eye,
                color: Colors.white,
                size: 50,
              ),
              Text('View Student',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ]),
      ),
    );
  }
}
