import 'package:flutter/material.dart';

class ResponesivePage extends StatefulWidget {
  const ResponesivePage({super.key});

  @override
  State<ResponesivePage> createState() => _ResponesivePageState();
}

class _ResponesivePageState extends State<ResponesivePage> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double width = MediaQuery.of(context).size.width;
    double heignt = MediaQuery.of(context).size.height;
    int _count = 2;
    if(orientation == Orientation.landscape){
      _count = 3;
    }
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Responesive Layout"),
            backgroundColor: Colors.blue.withOpacity(0.6),
          ),
          body: GridView.count(
            crossAxisCount: _count,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
