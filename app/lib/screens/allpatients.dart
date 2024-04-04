import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartassistant/api/fetchpatients.dart';
import 'package:smartassistant/contants/colors.dart';
import 'package:smartassistant/screens/patient.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({super.key});

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
  List<dynamic> res = [];

  setRes()async{
    var r = await fetchPatients();
    setState(() {
      res = json.decode(r)['data'];
    });
    print(res);
  }
  @override
  void initState(){
    super.initState();
   setRes();
  }
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
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Text(
                    "Patient Records",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.navyblue,
                        fontSize: 20),
                  ),
                  Image.asset(
                    "assets/heartright.png",
                    width: double.maxFinite,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: res.length,
                    itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                                color: AppColors.navyblue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${res[index]['name']['first'].toString()} ${res[index]['name']['last'].toString()}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(res[index]['gender'].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Patient(patient: res[index])));
                                        },
                                        icon: Icon(Icons.arrow_forward_ios)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
