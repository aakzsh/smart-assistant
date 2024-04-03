import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({super.key});

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
  List<String> hehe = ["", "", ""];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
           Stack(
            children: [Text(
                "Patient Records",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyblue,
                    fontSize: 20),
              ),
              Image.asset("assets/heartright.png", width: double.maxFinite,),],
           ),
            Expanded(child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ListTile(
                  title: Text("heh"),),
              ))),)
          ],),
        ),
      ),
    );
  }
}