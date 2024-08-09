import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SliderAlertExamble());
  }
}

class SliderAlertExamble extends StatefulWidget {
  const SliderAlertExamble({super.key});

  @override
  State<SliderAlertExamble> createState() => _SliderAlertExambleState();
}

class _SliderAlertExambleState extends State<SliderAlertExamble> {
  double slidervalue = 0.0;

  void _showValueDialogue(double) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Slider value"),
            content: Text("the value is $slidervalue"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("close"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" slider and alert"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("slider"),
            Slider(
              value: slidervalue,
              onChanged: (newvalue) {
                setState(() {
                  slidervalue = newvalue;
                });
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: slidervalue.round().toString(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _showValueDialogue(slidervalue);
                },
                child: const Text("Show value"))
          ],
        ),
      ),
    );
  }
}
