import 'dart:async';

import 'package:facebook/view/person.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  State<Complete> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<Complete> {
  void initState() {
    countDown() ;
    super.initState();
  }

  void countDown() {
    int seconds = 3;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      if (seconds < 0) {
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Person()),);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle ,color: Colors.green,size: 200,),
            Text('สมัครสมาชิกสำร็จ',style: TextStyle(color: Color(0xFF1FA44F),fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
