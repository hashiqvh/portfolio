import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/const.dart';
import 'package:my_portfolio/core/provider/data_provider.dart';
import 'package:my_portfolio/user/UI/about/user_about.dart';
import 'package:my_portfolio/user/UI/components/hover_container_vertical.dart';
import 'package:my_portfolio/user/UI/components/hover_icon.dart';
import 'package:my_portfolio/user/UI/experience/user_experience.dart';
import 'package:my_portfolio/user/UI/proejcts/projects.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  double x = 0.0;
  double y = 0.0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1519, 739),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Scaffold(
            body: Listener(
              onPointerHover: (event) {
                log("on pointer hover");
                setState(() {
                  x = event.position.dx;
                  y = event.position.dy;
                });
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 150.w,
                    ),
                    child: Consumer<DataProvider>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 173.h, bottom: 173.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Brittany Chiang',
                                        style: TextStyle(
                                          color: const Color(0xFFE2E8F0),
                                          fontSize: 48.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          // height: 0.02,
                                          letterSpacing: -1.20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        'Lead Engineer at Upstatement',
                                        style: TextStyle(
                                          color: const Color(0xFFE2E8F0),
                                          fontSize: 20.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          // height: 0.07,
                                          letterSpacing: -0.50,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        'I build accessible, inclusive products and\ndigital experiences for the web.',
                                        style: TextStyle(
                                          color: const Color(0xFF94A3B8),
                                          fontSize: 16.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 66.h,
                                      ),
                                      const HoverContainerVertical(
                                        ttile: "About",
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const HoverContainerVertical(
                                        ttile: "Experience",
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const HoverContainerVertical(
                                        ttile: "Projects",
                                      ),
                                      SizedBox(
                                        height: 44.h,
                                      ),
                                      Row(
                                        children: [
                                          const HoverIcon(
                                              iconData:
                                                  FontAwesomeIcons.github),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          const HoverIcon(
                                              iconData:
                                                  FontAwesomeIcons.linkedin),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          const HoverIcon(
                                              iconData:
                                                  FontAwesomeIcons.twitter),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 150.w,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UserAboutScreen(
                                            about: value.dataResponse
                                                .aboutUsData['content']),
                                        const Experience(),
                                        SizedBox(
                                          height: 142.h,
                                        ),
                                        const Projects(),
                                        SizedBox(
                                          height: 142.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Positioned(
                    top:
                        y - 40.0, // Adjust the circle's position for its center
                    left:
                        x - 40.0, // Adjust the circle's position for its center
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            offset: Offset(0, 0),
                            blurRadius: 200.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).fetchData(context);
    super.initState();
  }
}
