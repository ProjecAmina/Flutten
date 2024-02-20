import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/icon.png',
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.32,
                fit: BoxFit.cover,
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
                    prefixIcon:
                        const Icon(Icons.password, color: Colors.white70),
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
                child: OutlinedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/home') ,
                     child: const Text('Войти')
                     ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InkWell(
                child: const Text(
                  'Нет аккаунта. Зарегистриркйтесь!',
                  style: TextStyle(color: Colors.white54),
                ),
                onTap: () => Navigator.popAndPushNamed(context, '/reg'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
