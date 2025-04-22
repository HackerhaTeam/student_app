import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class NavConstants {
  static final List<NavItem> navItems = [
    NavItem(
      icon: PhosphorIcons.houseSimple(),
      filledIcon: PhosphorIcons.houseSimple(PhosphorIconsStyle.fill),
      label: 'الرئيسية',
      index: 0,
    ),
    NavItem(
      icon: PhosphorIcons.video(),
      filledIcon: PhosphorIcons.video(
        PhosphorIconsStyle.fill,
      ),
      label: 'الدورات',
      index: 1,
    ),
    NavItem(
      icon: PhosphorIcons.bookmarkSimple(),
      filledIcon: PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill),
      label: 'المحفوظات',
      index: 2,
    ),
    NavItem(
      icon: PhosphorIcons.userCircle(),
      filledIcon: PhosphorIcons.userCircle(PhosphorIconsStyle.fill),
      label: 'حسابي',
      index: 3,
    ),
  ];
}

class NavItem {
  final IconData icon;
  final IconData filledIcon;
  final String label;
  final int index;

  const NavItem({
    required this.icon,
    required this.filledIcon,
    required this.label,
    required this.index,
  });
}

class AnimatedBottomNavBar extends StatelessWidget {
  final Color? selectedColor;
  final Color? unselectedColor;
  final int currentIndex;
  final Function(int) onTap;

  const AnimatedBottomNavBar({
    super.key,
    this.selectedColor,
    this.unselectedColor,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = theme.extension<AppContent>();

    final xLabelSmall = Theme.of(context).textTheme.xLabelSmall;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        selectedLabelStyle: xLabelSmall,
        unselectedLabelStyle: xLabelSmall,
        selectedItemColor: selectedColor ?? content?.brandPrimary,
        unselectedItemColor: unselectedColor ?? content?.secondary,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items:
            NavConstants.navItems.map((item) => _buildNavItem(item)).toList(),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(NavItem item) {
    final isSelected = currentIndex == item.index;
    final color = isSelected ? selectedColor : unselectedColor;

    return BottomNavigationBarItem(
      icon: Directionality(
        textDirection: TextDirection.ltr,
        child: _AnimatedNavIcon(
          icon: isSelected ? item.filledIcon : item.icon,
          isSelected: isSelected,
          color: color,
        ),
      ),
      label: item.label,
    );
  }
}

class _AnimatedNavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color? color;

  const _AnimatedNavIcon({
    required this.icon,
    required this.isSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: PhosphorIcon(
        icon,
        color: color,
        size: 24.w(context),
        fill: isSelected ? 1.0 : 0.0,
      ),
    );
  }
}
