import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final double _iconSize = 30;

  const LayoutScaffold({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: navigationShell.goBranch,
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: Theme.of(context).colorScheme.primary,
        labelPadding: EdgeInsets.zero,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              size: _iconSize,
              color: navigationShell.currentIndex == 0
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: _iconSize,
              color: navigationShell.currentIndex == 0
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.favorite,
              size: _iconSize,
              color: navigationShell.currentIndex == 1
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            icon: Icon(
              Icons.favorite_outline,
              size: _iconSize,
              color: navigationShell.currentIndex == 1
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            label: 'Wishlist',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.article,
              size: _iconSize,
              color: navigationShell.currentIndex == 2
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            icon: Icon(
              Icons.article_outlined,
              size: _iconSize,
              color: navigationShell.currentIndex == 2
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            label: 'Categories',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.local_mall,
              size: _iconSize,
              color: navigationShell.currentIndex == 3
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            icon: Icon(
              Icons.local_mall_outlined,
              size: _iconSize,
              color: navigationShell.currentIndex == 3
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              size: _iconSize,
              color: navigationShell.currentIndex == 4
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            icon: Icon(
              Icons.person_outline,
              size: _iconSize,
              color: navigationShell.currentIndex == 4
                  ? Theme.of(context).colorScheme.onPrimary
                  : null,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
