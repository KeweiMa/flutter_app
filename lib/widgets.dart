import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// @author: kma
/// @date: 2023/06/29

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    super.key,
    required this.androidBuilder,
    required this.iosBuilder,
});

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;


  @override
  Widget build(context) {
    assert(
    defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS,
    'Unexpected platform $defaultTargetPlatform');
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => androidBuilder(context),
      TargetPlatform.iOS => iosBuilder(context),
      _ => const SizedBox.shrink()
    };
  }
}
