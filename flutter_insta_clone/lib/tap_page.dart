import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/account_page.dart';
import 'package:flutter_insta_clone/search_page.dart';

import 'home_page.dart';

class TapPage extends StatefulWidget {
  final User? user;

  const TapPage({Key? key, this.user}) : super(key: key);

  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int _selectedIndex = 0;

  late List _pages;

  @override
  void initState() {
    _pages = [
      HomePage(user: widget.user),
      SearchPage(user: widget.user,),
      AccountPage(user: widget.user,),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account')
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
