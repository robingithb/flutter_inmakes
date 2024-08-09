import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;
  static final List<Widget> _widgetOption = <Widget>[
    const Text("Home-Screen"),
    const Text("Search-Screen"),
    const Text("Profile-Screen"),
  ];

  void _onSelectItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bottom Navigation"),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOption.elementAt(_selectIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: _onSelectItem,
        ),
      ),
    );
  }
}
