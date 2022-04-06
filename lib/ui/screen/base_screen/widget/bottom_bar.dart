import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyvanny/core/constant/app_icon.dart';
import 'package:nannyvanny/ui/screen/base_screen/controller/base_controller.dart';
import 'package:nannyvanny/ui/screen/base_screen/model/bottom_model.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<BottomBarIcon> bottomBarIconList = [
    BottomBarIcon(title: "Home", icon: AppIcons.homeIcon),
    BottomBarIcon(title: "Packages", icon: AppIcons.packagesIcon),
    BottomBarIcon(title: "Bookings", icon: AppIcons.bookingsIcon),
    BottomBarIcon(title: "Profile", icon: AppIcons.profileIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (BaseController baseController) {
        return SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                bottomBarIconList.length,
                (index) => GestureDetector(
                  onTap: () {
                    baseController.currentIndex = index;
                    baseController.update();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        bottomBarIconList[index].icon,
                        height: 30,
                        width: 30,
                        color: baseController.currentIndex == index
                            ? Colors.pinkAccent
                            : Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bottomBarIconList[index].title,
                        style: TextStyle(
                          fontSize: 11,
                          color: baseController.currentIndex == index
                              ? Colors.pinkAccent
                              : Colors.black,
                        ),
                      ),
                      baseController.currentIndex == index
                          ? const CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.pinkAccent,
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
