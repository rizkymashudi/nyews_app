import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyews_app/common/style.dart';
import 'package:nyews_app/ui/article_list_page.dart';
import 'package:nyews_app/ui/settings_page.dart';
import 'package:nyews_app/widgets/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: _androidBuilder, iOSBuilder: _iOSBuilder);
  }

  Widget _androidBuilder(BuildContext context) {
    return Scaffold(
      body: bottomNavIndex == 0 ? const ArticleListPage() : const Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: bottomNavIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headline'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _iOSBuilder(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: secondaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news), label: 'Headline'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const ArticleListPage();
          case 1:
            return const SettingsPage();
          default:
            return const Placeholder();
        }
      },
    );
  }
}
