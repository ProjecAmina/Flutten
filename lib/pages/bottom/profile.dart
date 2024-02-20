import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                            
                  children: [
                    const Text('Иванов', style: TextStyle(color: Colors.white),),
                    const Text('Иван', style: TextStyle(color: Colors.white),),
                    const Text('Иванович', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              subtitle: const Text('+7589658456', style: TextStyle(color: Colors.white54),),
              //переправить на Image.network
              leading: const Icon(Icons.account_box, color: Colors.white,),
              trailing: IconButton(icon: const Icon(Icons.arrow_right, color: Colors.white,),
              onPressed: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}