import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/pages/bottom/profile.dart';

class AddResumesPage extends StatefulWidget {
  const AddResumesPage({super.key});

  @override
  State<AddResumesPage> createState() => _AddResumesPageState();
}

class _AddResumesPageState extends State<AddResumesPage> {
  TextEditingController positionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController salaryControllet = TextEditingController();
  final String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;
  
getUserById() async {
    final DocumentSnapshot documentSnapshot = await colRef.doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  @override 
  void initState(){
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () => Navigator.popAndPushNamed(context, '/home'),
        icon: const Icon(Icons.arrow_left,
        color: Colors.white,
        ),
        ),
        title: const Text('Добавление/Изменение резюме',
        textScaler: TextScaler.linear(1.2)
        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: positionController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white70,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'Должность',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Должность',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),

             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

             SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: salaryControllet,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white70,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'ЗП',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'ЗП',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),

             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

             SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: descriptionController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white70,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelText: 'Обо мне',
                  labelStyle: const TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: 'Обо мне',
                  hintStyle: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //доделать добавление в firebase 
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () async {},
                child: const Text("Добавить",),
              ),
            ),
            ],
            ),
        ),
    );
  }
}