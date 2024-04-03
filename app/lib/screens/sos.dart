import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';

class SOS extends StatefulWidget {
  const SOS({super.key});

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {
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
                "SOS Calls!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.peacered,
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
              ))),)          ],),
        ),
      ),
    );
  }
}