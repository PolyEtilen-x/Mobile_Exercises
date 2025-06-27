// navigation_bottom.dart
import 'package:flutter/material.dart';
import '../admin_page.dart';
import '../bookListScreen.dart';
import '../studentListScreen.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AdminPage(),
    const StudentListPage(),
    const BookListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Sinh viên'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Sách'),
        ],
      ),
    );
  }
}