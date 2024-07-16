import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:huynhcodaidaover2/ui_components/linear_gradients.dart';

import 'package:huynhcodaidaover2/widgets/app_bar_01_widget.dart';
import 'package:huynhcodaidaover2/widgets/menu_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradients.main,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar01Widget(
            height: 160,
          ),
          body: Container(
            child: MenuWidget(),
          ),
          bottomNavigationBar: Container(
            height: 180,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withAlpha(240),
              selectedIconTheme: IconThemeData(
                size: 78,
              ),
              selectedItemColor: Colors.red,
              selectedFontSize: 38,
              unselectedIconTheme: IconThemeData(
                size: 78,
              ),
              unselectedItemColor: Colors.black45,
              unselectedFontSize: 38,
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
              onTap: (index) => setState(() => _currentIndex = index),
            ),
          ),
        ),
      ),
    );
  }
}
