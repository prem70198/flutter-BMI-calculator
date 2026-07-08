import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff5B5FEF),
            Color(0xff7C4DFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),

      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text(
            "Calculate your Body Mass Index",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),

        ],
      ),
    );
  }
}