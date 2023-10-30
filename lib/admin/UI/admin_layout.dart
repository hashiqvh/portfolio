import 'package:flutter/material.dart';
import 'package:my_portfolio/admin/components/side_bar.dart';

class AdminLayout extends StatelessWidget {
  const AdminLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideBar(),
        const Expanded(child: Placeholder()),
      ],
    );
  }
}
