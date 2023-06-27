import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ItemsTab extends StatefulWidget {
  static const title = 'Items';
  static const androidIcon = Icon(Icons.dns);
  static const iosIcon = Icon(CupertinoIcons.bars);

  const ItemsTab({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  static const _itemsLength = 50;

  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> itemNames;

  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    colors = getRandomColors(_itemsLength);
    itemNames = getRandomNames(_itemsLength);
  }

  Future<void> _refreshData() {
    return Future.delayed(
      const Duration(seconds: 2),
        () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index > _itemsLength) return Container();

    final color = defaultTargetPlatform == TargetPlatform.iOS ? colors[index] : colors[index].shade400;

    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: index,
        child: HeroAnimatingCard(
          item: itemNames[index],
          color: color,
          heroAnimation: const AlwaysStoppedAnimation(0),
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(
                builder: (context) => ItemDetailTab(
                  id: index,
                  item: itemNames[index],
                  color: color,
                ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePlatform() {}

  Widget _buildAndroid(BuildContext context){
    return Scaffold();
  }

  Widget _buildIos(BuildContext context){
    return Scaffold();
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}