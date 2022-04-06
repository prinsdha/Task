import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyvanny/core/constant/app_colors.dart';
import 'package:nannyvanny/core/constant/app_icon.dart';
import 'package:nannyvanny/core/utils/globle.dart';
import 'package:nannyvanny/ui/screen/base_screen/controller/base_controller.dart';
import 'package:nannyvanny/ui/screen/base_screen/widget/bottom_bar.dart';
import 'package:nannyvanny/ui/screen/base_screen/widget/drawer.dart';
import 'package:nannyvanny/ui/screen/home_screen/home_screen.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "/BaseScreen";
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  BaseController baseController = Get.find<BaseController>();
  @override
  void initState() {
    super.initState();

    baseController.animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    baseController.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: baseController.animationController,
      builder: (context, child) {
        double slide = rightSlide * baseController.animationController.value;
        double scale = 1 - (baseController.animationController.value * 0.3);
        return Stack(
          children: [
            GestureDetector(
                onTap: () {
                  baseController.animationController.reverse();
                },
                child: const DrawerSide()),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                body: GetBuilder(
                  builder: (BaseController baseController) {
                    return SafeArea(
                      child: IndexedStack(
                        children: tabNavigation,
                        index: baseController.currentIndex,
                      ),
                    );
                  },
                ),
                bottomNavigationBar: const BottomBar(),
              ),
            ),
          ],
        );
      },
    );
  }
}
