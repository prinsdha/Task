import 'package:flutter/material.dart';
import 'package:nannyvanny/core/constant/app_colors.dart';
import 'package:nannyvanny/core/constant/app_icon.dart';
import 'package:nannyvanny/ui/screen/base_screen/base_screen.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> drawerList = [
      "Home",
      "Book A Nanny",
      "How It Works",
      "Why Nanny Vanny",
      "My Bookings",
      "My Profile",
      "Support",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: AppColor.textPinkColor,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(AppIcons.dummyPhoto)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Emily Cyrus",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.textPinkColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  drawerList.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        drawerList[index],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.blueTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      index == 6
                          ? Container()
                          : Container(
                              height: .5,
                              color: Colors.black.withOpacity(.3),
                            )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
