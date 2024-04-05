import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';
import 'package:smartassistant/screens/allpatients.dart';
import 'package:smartassistant/screens/sos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Image.asset(
                "assets/heartbeat.png",
                width: double.maxFinite,
              ),
              const Text(
                "Smart Assistant\nfor Hospitals",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.navyblue,
                    fontSize: 30),
              )
            ],
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            color: AppColors.navyblue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AllPatients()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white70,
                  minWidth: 300,
                  height: 50,
                  child: const Text("Patient Records"),
                ),
                const SizedBox(height: 20,),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SOS()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white70,
                  minWidth: 300,
                  height: 50,
                  child: const Text("Recent SOS Calls"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
