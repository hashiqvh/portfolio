import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAboutScreen extends StatelessWidget {
  final String about;
  const UserAboutScreen({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 528.w,
      child: Padding(
        padding: EdgeInsets.only(
          top: 173.h,
          bottom: 142.h,
        ),
        child: Text(
          about,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
