import 'package:atmos_app/models/weather_item.dart';
import 'package:atmos_app/pages/dashboard_page.dart';
import 'package:atmos_app/pages/home_page.dart';
import 'package:atmos_app/services/api_service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late Future<WeatherItem> _dadosDaApi;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _dadosDaApi = ApiService().fetchData();
  }

  void _refreshData() {
    setState(() {
      _dadosDaApi = ApiService().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      HomePage(dadosDaApi: _dadosDaApi, onRefresh: _refreshData),
      DashboardPage(dadosDaApi: _dadosDaApi),
    ];

    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
            activeIcon: Icon(Icons.dashboard, color: Colors.blue),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.map),
          //   label: "Map",
          //   activeIcon: Icon(Icons.map, color: Colors.blue),
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
