
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget{
  final double height ;
  final ValueChanged<double> onChanged;


  const HeightCard({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 18,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ]
          ),

          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 18),
                Text('HEIGHT',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800,
                  ),),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toInt().toString(),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0 , left: 6.0),
                      child: const Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(

                    activeTrackColor: const Color(0xff5B5FEF),

                    inactiveTrackColor: Colors.grey.shade300,

                    thumbColor: const Color(0xff5B5FEF),

                    overlayColor: const Color(0xff5B5FEF).withOpacity(0.2),

                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                    ),

                  ),
                  child: Slider(value: height,
                      min: 120,
                      max: 220,
                      onChanged: onChanged,
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

}