// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var wtcontroller = TextEditingController();
//   var ftcontroller = TextEditingController();
//   var incontroller = TextEditingController();
//   var result = "";
//   var bgcolor = Colors.grey.shade300;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//           title: Text('BMI Calculator'),
//         ),
//         body:Container(
//           color: bgcolor,
//           child: Center(
//             child: Container(
//               width: 300,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('BMI' , style: TextStyle(fontSize: 35 ,
//                       fontWeight: FontWeight.w700,
//                       decoration: .underline,
//                       decorationThickness: 1.5),),
//
//                   SizedBox(height: 11,),
//
//                   TextField(
//                     controller: wtcontroller,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         label: Text('Enter Your Weight :'),
//                         prefixIcon: Icon(Icons.line_style)
//                     ),
//                   ),
//
//                   SizedBox(height: 11,),
//
//                   TextField(
//                     controller: ftcontroller,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         label: Text('Enter Height in Ft.'),
//                         prefixIcon: Icon(Icons.line_style)
//                     ),
//                   ),
//
//                   SizedBox(height: 11,),
//
//                   TextField(
//                     controller: incontroller,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         label: Text('Enter Height in Inch'),
//                         prefixIcon: Icon(Icons.line_style)
//                     ),
//                   ),
//
//                   SizedBox(height: 11,),
//
//                   ElevatedButton(onPressed: (){
//                     var wt = wtcontroller.text.toString();
//                     var ft = ftcontroller.text.toString();
//                     var inch = incontroller.text.toString();
//
//                     if(wt!="" && ft!="" && inch!=""){
//                       //BMI Calculation
//                       var iWt = int.parse(wt);
//                       var iFt = int.parse(ft);
//                       var iInch = int.parse(inch);
//
//                       var tInch = (iFt * 12) + iInch;
//
//                       var tCm = tInch * 2.54;
//
//                       var tM = tCm/100;
//
//                       var bmi = iWt / (tM * tM);
//
//                       var msg = "";
//
//                       if(bmi > 25){
//                         msg = "You are OverWeight !!!";
//                         bgcolor = Colors.pinkAccent.shade100;
//                       }else if(bmi < 18){
//                         msg = "You are UnderWeight !!!";
//                         bgcolor = Colors.teal.shade50;
//                       }else{
//                         msg = "You are Healthy !!!";
//                         bgcolor = Colors.limeAccent.shade100;
//                       }
//
//                       setState(() {
//                         result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(3)}";
//                       });
//
//                     }else{
//                       setState(() {
//                         result = "Please fill all the required blanks";
//                       });
//                     }
//
//                   }, child: Text('Calculate')),
//
//                   SizedBox(height: 11,),
//
//                   Text(result , style: TextStyle(fontSize: 25),)
//                 ],
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

import 'package:bmi_application/widgets/height.dart';

import '../widgets/calculate_button.dart';
import '../widgets/gender_card.dart';
import '../widgets/header_widget.dart';

import 'result_screen.dart';

import 'package:flutter/material.dart';

import '../widgets/value_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 170;

  int weight = 65;
  int age = 22;

  void calculateBMI() {
      double heightInMeter = height/100;

      double bmi = weight / (heightInMeter * heightInMeter);

      print(bmi.toStringAsFixed(2));

      String result;
      String message;

      if (bmi < 18.5) {
        result = "Underweight";
        message = "You should eat a balanced diet to gain healthy weight.";
      } else if (bmi < 25) {
        result = "Normal";
        message = "Great! Your BMI is in the healthy range.";
      } else if (bmi < 30) {
        result = "Overweight";
        message = "Try regular exercise and maintain a balanced diet.";
      } else {
        result = "Obese";
        message = "Consider consulting a healthcare professional for guidance.";
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            bmi: bmi,
            result: result,
            message: message,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              const HeaderWidget(),
          
              const SizedBox(height: 25),
          
              const Text(
                "Select Gender",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 25),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GenderCard(
                          icon: Icons.man,
                          title: "Male",
                          isSelected: isMale,
                          onTap: (){
                            setState(() {
                              isMale = true;
                            });
                          },
                        ),
                    ),
          
                    SizedBox(width: 16),
          
                    Expanded(
                      child: GenderCard(
                            icon: Icons.woman,
                            title: "Female",
                            isSelected: !isMale,
                            onTap: (){
                              setState(() {
                                isMale = false;
                              });
                            },
                          ),
                    ),
          
          
                  ],
                ),
              ),
          
              const SizedBox(height: 25),
          
              const Text(
                "Select Height",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 25),
          
              HeightCard(
                height: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
          
              Text(
                "Selected Height : ${height.toInt()} cm",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    Expanded(
                      child: ValueCard(
                        title: "WEIGHT",
                        value: weight,
                        onIncrement: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if(weight > 1){
                              weight--;
                            }
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: ValueCard(
                        title: "AGE",
                        value: age,
                        onIncrement: () {
                          setState(() {
                            age++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if(age > 1){
                              age--;
                            }
                          });
                        },
                      ),
                    ),

                  ],
                ),
              ),

              CalculateButton(onPressed: calculateBMI),
          
            ],
          ),
        ),
      )
    );
  }
}