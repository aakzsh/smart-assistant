import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
           Stack(
            children: [Text(
                "John Doe",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyblue,
                    fontSize: 20),
              ),
              Image.asset("assets/heartright.png", width: double.maxFinite,),],
           ),
            Expanded(child: ListView.builder(itemBuilder: ((context, index) => ListTile())),)
          ],),
        ),
      ),
    );
  }
}