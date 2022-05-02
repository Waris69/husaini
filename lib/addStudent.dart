import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:husaini/homepage.dart';
//import 'package:husaini/Controller.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddStudent> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddStudent> {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference = _firestore.collection("students");
  static final DocumentReference = CollectionReference.doc("stu1");
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var parentName = "";
  var phoneNumber = "";
  var email = "";

  final nameController = TextEditingController();
  final parentnameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final emailController = TextEditingController();

  void dispose() {
    nameController.dispose();
    parentnameController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    parentnameController.clear();
    phonenumberController.clear();
    emailController.clear();
  }

  addStudent() async {
    Map<String, dynamic> data = {
      "Name": "Mehdi Haider",
      "Parent Name": "Haider Ali",
      "Phone Number": "+92 322 2388314",
      "Email": "mehdi@gmail.com",
    };
    DocumentReference.set(data)
        .whenComplete(() => Fluttertoast.showToast(msg: 'Student Added'))
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString()));
    //print('User Added');
  }

  File? _image;
  final picker = ImagePicker();
  Future getImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(const HomePage(title: 'IEC HUSAINI'));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Add Student'),
      ),
      body: Column(
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
          GestureDetector(
            onTap: () {
              Get.bottomSheet(Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                      onTap: getImageFromCamera,
                    ),
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Gallery'),
                      onTap: getImageFromGallery,
                    ),
                  ],
                ),
              ));
            },
            child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: _image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 70,
                            ),
                            Text(
                              'Upload Photo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ])
                    : Image.file(_image!)),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              autofocus: false,
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
                  labelText: 'Name',
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              autofocus: false,
              controller: parentnameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Parent Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
                  labelText: 'Parent Name',
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              keyboardType: TextInputType.number,
              autofocus: false,
              controller: phonenumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Phone Number';
                }
                return null;
              },
              decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              autofocus: false,
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email';
                } else if (!value.contains('@')) {
                  return 'Please Enter Valid Email';
                }
                return null;
              },
              decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
                  labelText: 'Email Address',
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  name = nameController.text;
                  parentName = parentnameController.text;
                  phoneNumber = phonenumberController.text;
                  email = emailController.text;
                  addStudent();
                  clearText();
                });
              }
            },
            child: const SizedBox(
                width: 150,
                height: 40,
                child: Center(
                  child: Text(
                    'Add Student',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

// Widget sheet({required VoidCallback onClick}) {
//   return Container(
//     color: Colors.white,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ListTile(
//           leading: const Icon(Icons.camera_alt),
//           title: const Text('Camera'),
//           onTap: onClick,
//         ),
//         ListTile(
//           leading: const Icon(Icons.photo),
//           title: const Text('Gallery'),
//           onTap: () {},
//         ),
//       ],
//     ),
//   );
// }
