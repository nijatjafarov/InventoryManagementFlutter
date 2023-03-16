import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/common_widgets/app_bar.dart';
import 'package:inventory_management/pages/purchase.dart';
import 'package:inventory_management/pages/sale.dart';
import 'package:inventory_management/pages/info.dart';
import 'package:inventory_management/pages/analytics.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  
  final List<List<Widget>> _widgetOptions = [
    [const InfoPage(), const Text('Home')],
    [const SalePage(), const Text('Sales')],
    [const PurchasePage(), const Text('Purchase')],
    [const AnalyticsPage(), const Text('Analytics')]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: MyAppBar(titl: _widgetOptions[_currentIndex][1]),
      body: _widgetOptions[_currentIndex][0],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(26, 28, 74, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_alt_fill), label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.arrow_up_square_fill), label: "Sale"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.arrow_down_square_fill), label: "Purchase"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.table_fill), label: "Analytics"),
        ],
        unselectedItemColor: const Color.fromARGB(255, 177, 178, 210),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}