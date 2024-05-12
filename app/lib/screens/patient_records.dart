import 'package:flutter/material.dart';
import 'package:smartassistant/constants/colors.dart';
import 'package:smartassistant/constants/helper.dart';
import 'package:smartassistant/screens/individual_details.dart';

class PatienRecords extends StatefulWidget {
  const PatienRecords({super.key});

  @override
  State<PatienRecords> createState() => _PatienRecordsState();
}

class _PatienRecordsState extends State<PatienRecords> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
          const  Row(children: [
              Icon(Icons.book_outlined, size: 36, color: AppColors.secondary,),
              SizedBox(width: 10,),
              Text(Helper.patientRecords, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: AppColors.secondary),)
            ],),
            Image.asset("assets/heart-right.png"),
            Expanded(child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) => InkWell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Container(
                  height: 60,
                  width: w-40,
                  decoration: BoxDecoration(color: AppColors.lightblue, borderRadius: BorderRadius.circular(10)),
                  child: Padding(padding: const EdgeInsets.all(10.0), 
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("John Doe"), Text("31 M", style: TextStyle(fontWeight: FontWeight.bold),)],),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const IndividualDetails()));
                    }, icon: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  )
                  ),
                ),
              ),)
              )))
          ],
        ),
      )),
    );
  }
}