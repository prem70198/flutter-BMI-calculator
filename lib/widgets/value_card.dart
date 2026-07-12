import 'package:flutter/material.dart';

class ValueCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValueCard({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.circular(20),
        boxShadow: const[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            value.toString(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: IconButton(
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove),
                ),
              ),

              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade200,
                child: IconButton(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add),
                ),
              ),

            ],
          ),
        ],
      ),
      );
  }
}