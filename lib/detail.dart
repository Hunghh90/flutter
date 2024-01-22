import 'package:demo_ss1/entity/student_entity.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Detail({super.key});
  static const String routeName = "/detailPage";
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)?.settings.arguments as Student?;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("images/${student?.image}"),
                              fit: BoxFit.cover,
                            )
                        ),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${student?.name}"),
                            Text("${student?.address}"),
                            Text("${student?.age}"),
                          ],
                        ),
                      )
                  ),
                ],
              ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Back to first page", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.blue
            )
          ),
            ],
          ),
        ),
      ),
    );
  }
}
