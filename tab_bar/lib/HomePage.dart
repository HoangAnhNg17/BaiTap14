import 'package:flutter/material.dart';
import 'package:tab_bar/app.dart';
import 'package:tab_bar/screen1.dart';
import 'package:tab_bar/screen2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pages = <Widget>[];
  
  @override
  void initState() {
    // TODO: implement initState
    pages.addAll([Screen1(),Screen2()]);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count App'),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey,),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, color: Colors.grey,),
            label: 'Account',
            activeIcon: Icon(Icons.account_balance, color: Colors.blue,)
          )
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
