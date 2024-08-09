import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ui_components/linear_gradients.dart';

import '../widgets/app_bar_01_widget.dart';
import '../widgets/menu_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _routes = ['/','/menu','/lala'];
  void _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    GoRouter.of(context).go(_routes[index]);
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradients.main,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar01Widget(
            height: 32,
          ),
          body: Container(
            child: MenuWidget(),
          ),
          bottomNavigationBar: Container(
            height: 80,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withAlpha(240),
              selectedIconTheme: IconThemeData(
                size: 32,
              ),
              selectedItemColor: Colors.red,
              selectedFontSize: 16,
              unselectedIconTheme: IconThemeData(
                size: 32,
              ),
              unselectedItemColor: Colors.black,
              unselectedFontSize: 16,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  label:
                    'Trang chủ',

                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.rss_feed),
                    label:
                    'Thông báo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active),
                  label:
                  'Chuông tu',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.music_note),
                  label:
                  'Nhạc niệm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label:
                  'Cài đặt',
                ),
              ],
              onTap: _onTapped,
            ),
          ),
        ),
      ),
    );

  }

}
