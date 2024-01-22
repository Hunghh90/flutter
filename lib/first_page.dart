import 'package:demo_ss1/form_example.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
   FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text("First Page", style: TextStyle(color: Colors.green, fontSize: 50),),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue.withOpacity(0.5),
                  ),
                  child: Text("Go to Form Example", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.of(context).pushNamed(FormExample.routeName);
                  },
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
