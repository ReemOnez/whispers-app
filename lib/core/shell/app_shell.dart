import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../theme/theme.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -5))],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          child: Container(
            color: AppColors.theVoid,
            // padding: const EdgeInsets.only(top: 12),
            child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: AppColors.primary,
              type: BottomNavigationBarType.shifting,
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => _onTap(context, index),
              items: const [
                BottomNavigationBarItem(icon: Icon(PhosphorIconsRegular.house), activeIcon: Icon(PhosphorIconsFill.house), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(PhosphorIconsRegular.penNib), activeIcon: Icon(PhosphorIconsFill.penNib), label: 'Write'),
                BottomNavigationBarItem(icon: Icon(PhosphorIconsRegular.archive), activeIcon: Icon(PhosphorIconsFill.archive), label: 'Archive'),
                BottomNavigationBarItem(icon: Icon(PhosphorIconsRegular.user), activeIcon: Icon(PhosphorIconsFill.user), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
