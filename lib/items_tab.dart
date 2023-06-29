import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'widgets.dart';

class ItemsTab extends StatefulWidget{
  static const title = 'item';
  static const androidIcon = Icon(Icons.dashboard);
  static const iosIcon = Icon(CupertinoIcons.app);

  const ItemsTab({super.key, this.androidDrawer});
  final Widget? androidDrawer;

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab>{
  static const _itemsLength = 50;

  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> itemNames;

  @override
  void initState(){
    _setData();
    super.initState();
  }

  void _setData() {
    //colors = getRandomColors(_itemsLength);
    //itemNames = getItemNames(_itemsLength);
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
          () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index){
    return Container();
  }

  Widget _buildAndroid(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(ItemsTab.title),
      ),
      drawer: widget.androidDrawer,
      body: RefreshIndicator(
        key: _androidRefreshKey,
        onRefresh: _refreshData,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: _itemsLength,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context){
    return CustomScrollView();
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}