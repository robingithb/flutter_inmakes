import 'package:flutter/material.dart';

void main() {
  runApp(const Addimage());
}

class Addimage extends StatelessWidget {
  const Addimage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add Image"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  '/home/robin/flutter_intern/my_first_app/assets/images/paper_plane.png',
                  height: 300,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Image.asset(
                  '/home/robin/flutter_intern/my_first_app/assets/images/paper_rocket.png',
                  height: 300,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Image.asset(
                  '/home/robin/flutter_intern/my_first_app/assets/images/paper_plane.png',
                  height: 300,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Image.asset(
                  '/home/robin/flutter_intern/my_first_app/assets/images/paper_rocket.png',
                  height: 300,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
