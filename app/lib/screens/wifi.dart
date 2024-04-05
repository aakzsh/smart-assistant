import 'package:flutter/material.dart';
import 'package:smartassistant/contants/colors.dart';

class NoWifi extends StatelessWidget {
  const NoWifi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(":(",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.peacered,
                fontSize:100)),
          Row(),
          Text(
            "Not Connected to\nRight WiFi",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.navyblue,
                fontSize: 30),
          )
        ],
      ),
    );
  }
}
