import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

/**
 * 材料详情
 * @author: kma
 */

class ItemDetailTab extends StatelessWidget {
  const ItemDetailTab({
    required this.id,
    required this.itemName,
    required this.color,
    // required this.icon,
    super.key,
  });

  final int id;
  final String itemName;
  final Color color;

  Widget _buildBody() {
    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(itemName),
        previousPageTitle: 'Items',
      ),
      child: _buildBody(),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
