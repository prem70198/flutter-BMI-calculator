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

import '../widgets/gender_card.dart';
import '../widgets/header_widget.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

        ],
      )
    );
  }
}