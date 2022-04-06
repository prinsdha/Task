import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyvanny/core/constant/app_colors.dart';

class LoadingOverlay {
  void hide() {
    Navigator.pop(Get.context as BuildContext);
  }

  void show() {
    // Get.dialog(
    //   AppLoader(),
    //   barrierDismissible: false,
    // );
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context as BuildContext,
      barrierDismissible: false,
      builder: (BuildContext context) => AppLoader(),
    );
  }

  LoadingOverlay._create();

  factory LoadingOverlay.of() {
    return LoadingOverlay._create();
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: getLoader(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getLoader() {
  if (Platform.isIOS) {
    return const CupertinoActivityIndicator(
      color: AppColor.textPinkColor,
    );
  } else {
    return const CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.pinkColor));
  }
}
