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
        GoRouter.of(context).go(
          "/admin/${menuItem.route}",
        );
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

class SideBar extends StatefulWidget {
  final String route;

  const SideBar({super.key, this.route = RouteUri.about});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<MenuItem> menuItems = [
    MenuItem('Info', RouteUri.adminAbout, Icons.account_circle),
    MenuItem('Experience', RouteUri.adminExperience, Icons.business_center),
    MenuItem('Projects', RouteUri.adminProjects, Icons.folder),
    // Add more menu items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;
    bool isSelected = location == widget.route;
    return Drawer(
      child: ListView(
        clipBehavior: Clip.none, // Set clipBehavior to none
        children: menuItems.map((item) {
          isSelected = location == item.route;
          return DrawerMenuItem(
            menuItem: item,
            isSelected: isSelected,
          );
        }).toList(),
      ),
    );
  }
}
