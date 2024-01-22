import 'package:demo_ss1/form_example.dart';
import 'package:demo_ss1/future_example.dart';
import 'package:demo_ss1/grid_view_example.dart';
import 'package:demo_ss1/responesive_example.dart';
import 'package:demo_ss1/stack_example.dart';
import 'package:flutter/material.dart';

import 'entity/student_entity.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> with TickerProviderStateMixin {
  List<Student> students = [
    Student(name:"Hung",image: "01.jpg",age:33,address: "Bac Kan"),
    Student(name:"Huy",image: "02.jpg",age:33,address: "Nam Dinh"),
    Student(name:"Quoc",image: "03.jpg",age:33,address: "Ha Noi"),
    Student(name:"Nam",image: "04.jpg",age:33,address: "Ha Nam"),
    Student(name:"Viet",image: "05.jpg",age:33,address: "Thai Binh"),
    Student(name:"Tuan",image: "06.jpg",age:33,address: "Quang Ninh"),
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text:"Places"),
                      Tab(text:"Inspiration"),
                      Tab(text:"Emotion"),
                    ],
                  ),
                ),

              Container(
                width: 200,
                height: 350,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: students.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: double.infinity,
                            height: 300,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage("images/${students[index].image}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          students[index].name,
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                                        ),
                                        Text(
                                          "Age: ${students[index].age}",
                                          style: TextStyle(fontSize: 16,color: Colors.white),
                                        ),
                                        Text(
                                          "Address: ${students[index].address}",
                                          style: TextStyle(fontSize: 16,color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    FuturePage(),
                   ResponesivePage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
