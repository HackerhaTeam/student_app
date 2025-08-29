import 'package:flutter/material.dart';

class TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  TabBarHeaderDelegate(this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => 48; 
  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant TabBarHeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
