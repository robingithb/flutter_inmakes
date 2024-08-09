import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StackbarExamble(),
    );
  }
}

class StackbarExamble extends StatefulWidget {
  const StackbarExamble({super.key});

  @override
  State<StackbarExamble> createState() => _StackbarExambleState();
}

class _StackbarExambleState extends State<StackbarExamble> {
  String _message = '';

  void _displayinfo() {
    final snackbar = SnackBar(
      content: const Text("this is from snackbar"),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
          label: "view",
          onPressed: () {
            setState(() {
              _message = "completely wrong";
            });
          }),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack bar"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _displayinfo, child: const Text("show snack bar")),
            const SizedBox(
              height: 20,
            ),
            Text(_message.toString())
          ],
        ),
      ),
    );
  }
}
