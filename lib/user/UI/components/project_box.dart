import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';

class ProjectBox extends StatefulWidget {
  const ProjectBox({super.key});

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          width: 528.w,
          margin: EdgeInsets.only(bottom: 48.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: secondaryColor.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: isHovered ? primaryColor : const Color(0xFF27272A)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.80.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120.w,
                  color: Colors.blueGrey,
                  height: 120.h,
                ),
                SizedBox(width: 16.w),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Engineer · Flutter Development',
                      style: TextStyle(
                        color: const Color(0xFFE2E8F0),
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        //height: 0.08,
                      ),
                    ),
                    SizedBox(height: 6.30.h),
                    Text(
                      'Deliver high-quality, robust production code for a diverse\narray of projects for clients including Harvard Business\nSchool, Everytown for Gun Safety, Pratt Institute, Koala\nHealth, Vanderbilt University, The 19th News, and more.\nProvide leadership within engineering department through\nclose collaboration, knowledge shares, and mentorship.',
                      style: TextStyle(
                        color: const Color(0xFF94A3B8),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        // height: 0.11,
                      ),
                    ),
                    SizedBox(height: 17.30.h),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 8, right: 16, bottom: 3.60),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.link,
                                size: 10.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'The Verge',
                                style: TextStyle(
                                  color: const Color(0xFFCBD5E1),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
