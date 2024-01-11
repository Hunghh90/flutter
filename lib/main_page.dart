import 'package:demo_ss1/home_page.dart';
import 'package:demo_ss1/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'form_example.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "This is AppBar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.blue.withOpacity(0.6),
          ),
          body: IndexedStack(
            index: _curentIndex,
            children:[
              const HomePage(),
              TabBarExample(),
              FormExample(),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _curentIndex,
            onTap: (index){
              setState(() {
                _curentIndex = index;
              });
            },
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            items: [
              SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home")),
              SalomonBottomBarItem(icon: Icon(Icons.search), title: Text("Search")),
              SalomonBottomBarItem(icon: Icon(Icons.settings), title: Text("Setting")),
            ]
          ),
        ),
      ),
    );
  }
}
