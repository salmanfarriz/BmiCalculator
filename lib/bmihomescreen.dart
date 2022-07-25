import 'package:bmicalculator/bmiresult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BmiCalculator extends StatefulWidget {
  BmiCalculator({
    Key? key,
  }) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int selectedIndex = 0;
  String result = '';
  TextEditingController age = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Lets Calculate \nyour current BMI',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 31, 173, 3)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'You can find out whether you are \nOverweight, Underweight or Ideal weight.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 68, 67, 67)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    radioButton('Male', Color.fromARGB(255, 30, 30, 30), 0),
                    SizedBox(
                      width: 30,
                    ),
                    radioButton('Women', Color.fromARGB(255, 30, 30, 30), 1),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: age,
                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Height'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Weight'),
                ),
                const SizedBox(
                  height: 140,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 31, 173, 3)),
                      ),
                      onPressed: () {
                        // Get.to(const BMI());
                        double height =
                            double.parse(heightController.value.text);
                        double weight =
                            double.parse(weightController.value.text);
                        calculateBmi(height, weight);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BMI(bmiResult: result),
                            ));
                      },
                      child: const Text(
                        'Calculate BMI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text('Your BMI : $result',
                //     style: const TextStyle(
                //         fontSize: 28,
                //         fontWeight: FontWeight.bold,
                //         color: Color.fromARGB(255, 39, 39, 38)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void indexChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 60,
        width: 90,
        child: FlatButton(
          textColor: Colors.white,
          color: selectedIndex == index
              ? color
              : Color.fromARGB(255, 250, 248, 248),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            indexChange(index);
          },
          child: Text(
            value,
            style: TextStyle(
                color: selectedIndex == index ? (Colors.white) : color,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double heightInMeter = height / 100;
    double finalresult = weight / (heightInMeter * heightInMeter);
    String bmi = finalresult.toStringAsFixed(1);
    setState(() {
      result = bmi;
    });
  }
}
