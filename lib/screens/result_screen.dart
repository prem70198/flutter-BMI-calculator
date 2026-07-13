import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ResultScreen extends StatelessWidget{
  final double bmi;
  final String result;
  final String message;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.result,
    required this.message,
  });

  Color getResultColor() {
    switch (result) {
      case "Normal":
        return Colors.green;

      case "Underweight":
        return Colors.orange;

      default:
        return Colors.red;
    }
  }


// CHANGED: Dynamic Result Icon

  IconData getResultIcon() {
    switch (result) {
      case "Normal":
        return Icons.sentiment_satisfied_alt;

      case "Underweight":
        return Icons.sentiment_dissatisfied;

      case "Overweight":
        return Icons.sentiment_neutral;

      case "Obese":
        return Icons.warning_amber;

      default:
        return Icons.health_and_safety;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "BMI Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFFF5F2FF),
            Color(0xFFE9E4FF),
          ]),
        ),
        child: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(24),
                constraints: const BoxConstraints(
                  maxWidth: 420,
                  minHeight: 550
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),

                    CircleAvatar(
                      radius: 42,
                      backgroundColor: AppColors.primary.withOpacity(.1),
                      child: Icon(
                        getResultIcon(),
                        size: 40,
                        color: getResultColor(),
                      ),
                    ),

                    Text(
                      "Your BMI",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      bmi.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color:getResultColor(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primary,
                                Color(0xFF7B61FF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),

                            splashColor: Colors.white24,
                            highlightColor: Colors.white10,

                            onTap: () {
                              Navigator.pop(context);
                            },

                            child: const Center(
                              child: Text(
                                "CALCULATE AGAIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}