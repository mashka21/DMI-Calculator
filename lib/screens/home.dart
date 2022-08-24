import 'package:body_mass_calculator/contstants/app_constants.dart';
import 'package:body_mass_calculator/widgets/left_bar.dart';
import 'package:body_mass_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  double result =0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentHexColor,
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: height,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: weight,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'weight',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                double h = double.parse(height.text);
                double w = double.parse(weight.text);
                setState(() {
                  result = w/(h*h);
                  if(result >= 25){
                    textResult = 'your\'re Over weight';
                  } else if(result >= 18.5 && result < 25){
                    textResult = 'your\'re Normal weight';
                  } else {
                    textResult = 'you\'re Under weight';
                  }
                });
              },
              child: Container(
                child: Text("Calculate",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
              ),
            ),

            SizedBox(height: 50,),
            Container(
              child: Text(result.toStringAsFixed(2),style: TextStyle(fontSize: 72,color: accentHexColor),),
            ),
            SizedBox(height: 50,),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(textResult,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: accentHexColor),),
              ),
            ),

            SizedBox(height: 10,),
            LeftBar(barWidth: 30,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 30,),
            SizedBox(height: 10,),
            RightBar(barWidth: 40,),
            SizedBox(height: 30,),
            RightBar(barWidth: 40,),

          ],
        ),
      ),

    );
  }
}
