import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.monitor_weight_rounded,
              color: Colors.white,
              size: 50,
            ),

            SizedBox(height: 10),

            Text(
              "BMI Calculator",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 12),

            Text(
              "Calculate your Body Mass Index",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

          ],
        ),
      ),
    );
  }
}