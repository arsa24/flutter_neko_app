import "package:flutter/material.dart";
import "package:neko_app/pages/home_page.dart";
import "package:neko_app/pages/setting_page.dart";

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Save"),
    ),
    SettingPage()
  ];

  void _onItemNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemNavTap,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
