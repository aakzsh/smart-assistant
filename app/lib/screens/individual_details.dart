import 'package:flutter/material.dart';
import 'package:smartassistant/constants/colors.dart';

class IndividualDetails extends StatefulWidget {
  const IndividualDetails({super.key});

  @override
  State<IndividualDetails> createState() => _IndividualDetailsState();
}

class _IndividualDetailsState extends State<IndividualDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
          const  Row(children: [
              Icon(Icons.account_circle_outlined, size: 36, color: AppColors.secondary,),
              SizedBox(width: 10,),
              Text("John Doe", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: AppColors.secondary),)
            ],),
            Image.asset("assets/heart-right.png"),
            
          ],
        ),
      )),
    );
  }
}