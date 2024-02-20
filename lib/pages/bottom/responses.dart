import 'package:flutter/material.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage({super.key});

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const  Text(
                    "Должность",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text(
                    "50000-100000",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "Описание.....................................................",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                const Text(
                  "Статус : Отказ",
                  style: TextStyle(color: Colors.white),
                ),
              ]),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  const Text(
                    "Дата отклика :  20.02.2024 г.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
