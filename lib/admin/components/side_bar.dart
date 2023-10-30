import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/route_configuration.dart';

class DrawerMenuItem extends StatelessWidget {
  final MenuItem menuItem;
  final bool isSelected;

  const DrawerMenuItem(
      {super.key, required this.menuItem, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menuItem.icon),
      title: Text(menuItem.title),
      selected: isSelected,
      onTap: () {
        GoRouter.of(context).go(menuItem.route);
      },
    );
  }
}

class MenuItem {
  final String title;
  final String route;
  final IconData icon;

  MenuItem(this.title, this.route, this.icon);
}

class SideBar extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Introduction', RouteUri.adminIntro, Icons.info),
    MenuItem('About', RouteUri.adminAbout, Icons.account_circle),
    MenuItem('Experience', RouteUri.adminExperience, Icons.business_center),
    MenuItem('Projects', RouteUri.adminProjects, Icons.folder),
    // Add more menu items as needed
  ];

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;
    return Drawer(
      child: ListView(
        clipBehavior: Clip.none, // Set clipBehavior to none
        children: menuItems.map((item) {
          final isSelected = location == item.route;
          return DrawerMenuItem(
            menuItem: item,
            isSelected: isSelected,
          );
        }).toList(),
      ),
    );
  }
}
