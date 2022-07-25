import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'bmihomescreen.dart';

class BMI extends StatelessWidget {
  BMI({Key? key, required this.bmiResult}) : super(key: key);
  String bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 215, 215),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Color.fromARGB(255, 245, 245, 245),
                height: .65.sh,
                width: .85.sw,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text('Your BMI is \n',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 39, 38))),
                      Text(
                        '$bmiResult',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 46,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('data'),
                      SizedBox(
                        height: 130,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/icons/doctor.png',
                            height: 210,
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: .85.sw,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(BmiCalculator());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => BmiCalculator(),
                    //     ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.restart_alt), Text('\t\tStart over')],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
