import '../utils/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget{
  final IconData icon;
  final String title;
  final bool isSelected ;
  final VoidCallback onTap;


  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: isSelected ? 1.08 : 1.0,

          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            // height: 130,
            // width: 150,
            height: isSelected ? 145 : 130,
            //width: isSelected ? 180 : 120,

            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary :
                  Colors.white,
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : Colors.grey.shade300,
                width: 2,
              ),
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0,4),
            ),
          ],
        ),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon ,
                size: isSelected ? 60 : 50,
                color: isSelected
                  ? Colors.white
                  : AppColors.primary,
              ),

              const SizedBox(height: 14,),

              Text(title ,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected
                      ? Colors.white
                      : Colors.black,
                ),
              )
            ],
          ),
      ),),
    );
  }

}