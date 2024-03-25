import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseFirestore/profile_collection.dart';
import 'package:flutter_job/database/firebaseStorange/image_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

final colRef = FirebaseFirestore.instance.collection('profiles');

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  dynamic userDoc;
  File? selectImage;
  XFile? fileName;
  ImageStorage imageStorage = ImageStorage();
  ProfileCollection profileCollection = ProfileCollection();

  selectImageGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileName = returnImage;
      selectImage = File(returnImage!.path);
    });
  }
//////метод отправки на облако/////////
  ///

  void pushStorage() async {
    await imageStorage.addImageStorage(fileName!);
  }

  getUserById() async {
    final DocumentSnapshot documentSnapshot = await colRef.doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  Widget resumeCard(BuildContext context, dynamic docs) {
     return SizedBox(
     // height: MediaQuery.of(context).size.height * 0.4,
       child: Card(
        child: ListTile(
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(docs['position'],
                textScaler: const TextScaler.linear(1.2),
                style: const TextStyle(color: Colors.redAccent,
                 fontWeight: FontWeight.bold,
                ),
                
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.03,
                child: Text(docs['salary'],
                textScaler: const TextScaler.linear(1.2),
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.redAccent,
                 fontWeight: FontWeight.bold,
                ),
                
                ),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              SizedBox(
                 height: MediaQuery.of(context).size.height * 0.04,
                child: Text(docs['surname'] + " " + docs['name'] + " " + docs['patronymic']  ,
                textScaler: const TextScaler.linear(1.1),
                style: const TextStyle(color: Colors.white,
                ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: Text(
                  "Почта: ${ docs['email']}",
                textScaler: const TextScaler.linear(1.1),
                style: const TextStyle(color: Colors.white,
                ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: Text(
                  "Телефон: ${ docs['phone']}",
                textScaler: const TextScaler.linear(1.1),
                style: const TextStyle(color: Colors.white,
                ),
                ),
              ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: const Expanded(child:Divider(
                    color: Colors.red,
                    ), 
                    ),
                ),  
                
              SizedBox(
                child: Text(
                  "Обо мне: ${docs['description']}",
                textScaler: const TextScaler.linear(1.1),
                style: const TextStyle(color: Colors.white,
               ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: const Expanded(child:Divider(
                    color: Colors.red,
                    ), 
                    ),
                ),
             
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    alignment: Alignment.bottomRight,
                    child: Text(docs['date'],
                    textScaler: const TextScaler.linear(1.2),
                    style: const TextStyle(color: Colors.white,
                    ),
                    ),
                  ),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
       ),
     );
  }

  @override
  void initState() {
    getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      userDoc['surname'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      userDoc['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      userDoc['patronymic'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                userDoc['phone'],
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white54),
              ),
              //переправить на Image.network
              leading: userDoc['image'] == ''
                  ? CircleAvatar(
                      child: IconButton(
                          onPressed: () async {
                            selectImageGallery();
                            if (selectImage != null) {
                              pushStorage();
                              await Future.delayed(
                                const Duration(seconds: 4),
                              );
                              await profileCollection.editImageProfile(
                                  userDoc, imageStorage.pathImageUrl!);
                              Toast.show("Успешно!");
                              initState();
                            } else {
                              Toast.show('Выберите изображение');
                            }
                          },
                          icon: const Icon(Icons.add)),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(userDoc['image']),
                    ),
      
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Text(
            'Список резюме',
            textScaler: TextScaler.linear(
              MediaQuery.textScalerOf(context).scale(2),
            ),
            style: TextStyle(color: Colors.white),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('profiles')
                  .doc(userId)
                  .collection('resumes')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return resumeCard(context, snapshot.data!.docs[index]);
                    },
                  );
                }
              }),
        ],
      ),
    );
  }
}
