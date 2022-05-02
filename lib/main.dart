import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:husaini/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDoO8efzrDVveeXvqqrc39D3XiqfsyoKeU",
      appId: "1:1031493909898:web:3cd71413645447b67c1c73",
      messagingSenderId: "1031493909898",
      projectId: "diary-app-course-c6663",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'IEC HUSAINI'),
    );
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       // check for error
    //       if (snapshot.hasError) {
    //         // ignore: avoid_print
    //         print('Something went wrong');
    //       }
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return const GetMaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: HomePage(title: 'IEC HUSAINI'),
    //         );
    //       }
    //       return const Center(
    //           child: SizedBox(
    //         child: CircularProgressIndicator(),
    //         height: 60,
    //         width: 60,
    //       ));
    //     });
  }
}
