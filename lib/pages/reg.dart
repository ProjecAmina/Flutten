import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
          icon: const Icon(
            Icons.arrow_left_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.checklist, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Фамилия',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Фамилия',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.checklist, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Имя',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Имя',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.checklist, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Отчество',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Отчество',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Телефон',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Телефон',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.white70,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.password, color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelText: 'Пароль',
                    labelStyle: const TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: 'Пароль',
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: OutlinedButton (onPressed: () {}, child: const Text('Зарегистрироваться'),),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InkWell(
                child: const Text(
                  'Если у вас есть аккаунт. Нажмите сюда!',
                style: TextStyle(color: Colors.white54),
                ),
                onTap: () =>Navigator.popAndPushNamed(context,'/'),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ), 
              
              ],
              )
          ),
      ),
    );
  }
}
