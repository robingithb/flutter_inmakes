import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _content = "home_page";
  final List<String> _itemlist1 = ["iPhone", "Nothing 2", "SamSung S21"];
  final List<String> _itemlist2 = ["HP Pavilion", "Mac", "Lenovo", "Acer"];
  void _updateContent(String newContent) {
    setState(() {
      _content = newContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                "Products",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            ListTile(
              title: const Text(
                "Mobile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                _updateContent("Mobile");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                "LapTops",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                _updateContent("LapTops");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (_content == "Mobile") {
      return ListView.builder(
          itemCount: _itemlist1.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_itemlist1[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {},
            );
          });
    } else if (_content == "LapTops") {
      return ListView.builder(
          itemCount: _itemlist2.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _itemlist2[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            );
          });
    } else {
      return Center(
        child: Text(_content),
      );
    }
  }
}
