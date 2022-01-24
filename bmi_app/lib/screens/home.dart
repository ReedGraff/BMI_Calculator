import 'package:flutter/material.dart';

import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:bmi_app/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResults = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator App",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height (m)",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          )),
                    ),
                  ),

                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight (kg)",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);

                  setState(() {
                    _bmiResult = _w / (_h * _h);

                    if (_bmiResult > 25) {
                      _textResults = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResults = "You\'re normal weight";
                    } else {
                      _textResults = "You\'re under weight";
                    }
                  });
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor
                  ),
                )
              ),
              const SizedBox(height: 50),
              Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(fontSize: 90, color: accentHexColor),
              ),
              const SizedBox(height: 30),
              
              Visibility(
                visible: _textResults.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResults,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor
                    ),
                  ),
                )
              ),
              const SizedBox(height: 10),
              const LeftBar(barWidth: 40),
              const SizedBox(height: 20),
              const LeftBar(barWidth: 70),
              const SizedBox(height: 20),
              const LeftBar(barWidth: 40),
              const SizedBox(height: 20),
              const RightBar(barWidth: 70),
              const SizedBox(height: 50),
              const RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
