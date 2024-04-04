import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';

class Patient extends StatefulWidget {
  const Patient({super.key, required this.patient});
  final Map<String, dynamic> patient;

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
                 "${widget.patient['name']['first'].toString()} ${widget.patient['name']['last'].toString()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyblue,
                    fontSize: 20),
              ),
              Image.asset("assets/heartright.png", width: double.maxFinite,),],
           ),
           Text(widget.patient.toString()),
            Expanded(child: ListView.builder(itemBuilder: ((context, index) => ListTile())),),

             Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AllPatients()));
                  },
                  child: Text(
                    "Save Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: AppColors.navyblue,
                  minWidth: double.maxFinite,
                  height: 50,
                ),
              )
          ],),
        ),
      ),
    );
  }
}