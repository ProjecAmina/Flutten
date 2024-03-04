import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/user_service.dart';
import 'package:flutter_job/pages/bottom/profile.dart';
import 'package:flutter_job/pages/bottom/responses.dart';
import 'package:flutter_job/pages/bottom/vacancy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String? title = 'Вакансии';
  int index = 0;
  bool search = false;
  final pages = [
    const VacancyPage(),
    const ResponsesPage(),
    const ProfilePage(),
  ];
  AppBar appBarSearch = AppBar(
    title: TextField(),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
    ],
  );
  @override
  Widget build(BuildContext context) {
    AppBar appBarSearch = AppBar(
      title:  const TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          prefixIcon: Icon(Icons.search,color:Colors.white,),
          hintText: 'Поиск...',
          hintStyle: TextStyle(
            color: Colors.white38,
           ),
        ),
      ),
      actions: [
        IconButton(onPressed: () {
          setState(() {
            search = false;
          });
        }, icon: Icon(Icons.cancel),),
      ],
    );
    AppBar appBar = AppBar(

      title: Text(title!),
      leading: IconButton(icon: Icon(Icons.exit_to_app, color: Colors.white,),
      onPressed: ()async{
        await authService.logOut();
        Navigator.popAndPushNamed(context, '/');
      }),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              search = true;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: search? appBarSearch : appBar,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 0) {
              title = "Вакансии";
            }
            if (index == 1) {
              title = "Отклики";
            }
            if (index == 2) {
              title = "Профиль";
            }
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Вакансии'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Отклики'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль')
        ],
      ),
    );
  }
}
