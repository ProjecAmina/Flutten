import 'package:flutter/material.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const  Text('Должность',
                style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
               const Text('50000- 100000', style: TextStyle(color: Colors.white),),
               const Divider(
                color: Colors.white,
               ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text("hfvnfebvifnvcmncviopm,ceiormcvfejjjjjjjjjjjjjjjjjjgnriielwsoooooooojnvggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggrjeeee",
              style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Дата публикации", style: TextStyle(color: Colors.white),),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                OutlinedButton(onPressed: () {}, child: const Text("Откликнуться", style:  TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
