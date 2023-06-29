import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';
import 'items_tab.dart';

/**
 * 主页
 * @author: kma
 * @date: 2023/06/29
 */

void main() => runApp(const Application());

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Reverse 1999 Wiki',
      theme: ThemeData(primarySwatch: Colors.deepOrange, useMaterial3: true),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const Reverse1999HomePage(),
    );
  }
}

class Reverse1999HomePage extends StatefulWidget {
  const Reverse1999HomePage({super.key});

  @override
  State<Reverse1999HomePage> createState() => _Reverse1999HomePageState();
}

class _Reverse1999HomePageState extends State<Reverse1999HomePage> {
  Widget _buildAndroidHomePage(BuildContext context) {
    return ItemsTab(
      key: itemsTabKey,
      androidDrawer: _AndroidDrawer(),
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
          ],
        ),
        tabBuilder: (context, index) {
          assert(index <= 2 && index >= 0, 'Unexpected tab Index: $index');
          return switch(index){
            _ => const SizedBox.shrink(),
          };
        }
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(Icons.account_circle, color: Colors.deepOrange.shade800,
                size: 96,
              ),
            ),
          )
        ],
      ),
    );
  }
}
