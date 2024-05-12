import 'package:flutter/material.dart';
import 'package:smartassistant/constants/colors.dart';
import 'package:smartassistant/constants/helper.dart';
import 'package:smartassistant/screens/emergency_details.dart';
import 'package:smartassistant/screens/patient_records.dart';
import 'package:smartassistant/services/launch_url.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              Helper.shra,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: AppColors.secondary),
            ),
            const Text(
              "${Helper.connectedTo}\nSHRA-WIFI",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            Column(
              children: [
                MaterialButton(
                  height: 50,
                  minWidth: w,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColors.secondary,
                  child: const Text(
                    Helper.ping,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(Helper.pingToCheck)
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const PatienRecords())));
              },
              child: Container(
                width: w,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: AppColors.primary,
                          size: 56,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Helper.patientRecords,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const EmergencyDetails())));
              },
              child: Container(
                width: w,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.darkblue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.primary,
                          size: 56,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          Helper.emergencyCalls,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await launchWebUrl("https://github.com/aakzsh/smart-assistant");
              },
              child: const Center(
                child: Text(
                  Helper.aboutApp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
