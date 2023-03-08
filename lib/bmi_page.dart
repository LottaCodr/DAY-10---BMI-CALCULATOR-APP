import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  final String title;

  const Bmi({super.key, required this.title});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bmiResult = '';
  double bmi = 0.0;


  void calculateBmi() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double heightSquared = height * height;

    bmi = weight/heightSquared; //the main formular for calculating the bmi

    //now the measurements interpretation
    if(bmi < 18.5) {
      bmiResult = "Underweight";
    } else if(bmi >= 18.5 && bmi <= 24.9) {
    bmiResult = "Normal Weight";
    } else if (bmi  > 25 && bmi <=29.9) {
      bmiResult = "Over-Weight";
    } else {
      bmiResult = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.brown,

      ),
      
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter your height in meters',
                labelText: 'Height(m)',
              ),
            ),

            const SizedBox(height: 16,),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Weight in kg',
                labelText: 'Weight(kg)'
              ),
            ),

            const SizedBox(height: 16,),

            Text('Your BMI is ${bmi.toStringAsFixed(1)}',
            style: const TextStyle(
              fontSize: 24
            ),),
            
            Text('You are: $bmiResult'),
            
            const SizedBox(height: 16,),
            
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    calculateBmi();
                  });
                },
                child: const Text('Calculate') )
          ],
        ),),
      ),
    );
  }
}
