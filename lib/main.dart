import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets.dart';

import 'items_tab.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Testing App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
/*
  Widget build(BuildContext context){
    var appState = context.watch<AppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea: '),
          Text(appState.current.asLowerCase),
          ElevatedButton(onPressed: (){print('button pressed');}, child: Text('Next')),
        ],
      ),
    );
  }
   */
}

class _HomePageState extends State<HomePage> {
  // final itemTabKey = GlobalKey();

  Widget _buildAndroidHomePage(BuildContext context) {
    return ItemsTab(
      //key: itemTabKey,
        androidDrawer: _AndroidDrawer();
    );
  }


  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: ItemsTab.iosIcon,
            label: ItemsTab.title,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 2 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
                defaultTitle: ItemsTab.title,
                builder: (context) => ItemsTab(key: itemsTabKey),
              ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(androidBuilder: _buildAndroidHomePage, iosBuilder: _buildIosHomePage);
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(context){
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepOrange),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.orange.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: ItemsTab.androidIcon,
            title: const Text(ItemsTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}