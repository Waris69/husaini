import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:husaini/homepage.dart';
import 'package:husaini/studentDetails.dart';

class ViewStudent extends StatefulWidget {
  const ViewStudent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewStudent> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewStudent> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(const HomePage(title: 'IEC HUSAINI'));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('View Student'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Students',
                style: TextStyle(fontSize: 30),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: studentsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    // ignore: avoid_print
                    print('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 100,
                      ),
                    );
                  }

                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            child: Image.asset('images/logo.png'),
                            backgroundColor: Colors.white),
                        title: Text(data.docs[index]['Name']),
                        subtitle: Text(data.docs[index]['Email']),
                        trailing: const Text('view'),
                        onTap: () {
                          Get.to(const StudentDetails(
                            title: 'IEC HUSAINI',
                          ));
                        },
                      );
                    },
                  );
                }

                // ElevatedButton(
                //     onPressed: () {
                //       print(data.docs[0]['Name']);
                //     },
                //     child: const Text("Check")),
                // SizedBox(
                //   height: 450,
                //   child: getListView(),
                // )

                ),
          ],
        ));
  }
}

Widget getListView() {
  var listview = ListView(
    children: [
      ListTile(
        leading: CircleAvatar(
            child: Image.asset('images/logo.png'),
            backgroundColor: Colors.white),
        title: const Text('Waris'),
        subtitle: const Text('waris@gmail.com'),
        trailing: const Text('view'),
        onTap: () {
          Get.to(const StudentDetails(
            title: 'IEC HUSAINI',
          ));
        },
      ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
      // ListTile(
      //   leading: CircleAvatar(
      //       child: Image.asset('images/logo.png'),
      //       backgroundColor: Colors.white),
      //   title: Text('Name'),
      //   subtitle: Text('Details'),
      // ),
    ],
  );
  return listview;
}
