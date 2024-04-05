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
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  const Text(
                    "SOS Calls!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.peacered,
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
                    itemCount: 10,
                    itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 100,
                            decoration: BoxDecoration(
                                color: AppColors.peacered.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
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
                                        "John Doe",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Timestamp: 2024-03-04 10:23:22",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                      Text("Ward Number: 23",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AllPatients()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: AppColors.navyblue,
                  minWidth: double.maxFinite,
                  height: 50,
                  child: const Text(
                    "Clear All",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
