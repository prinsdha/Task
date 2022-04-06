import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nannyvanny/core/constant/app_colors.dart';
import 'package:nannyvanny/core/constant/app_icon.dart';
import 'package:nannyvanny/core/utils/loader.dart';
import 'package:nannyvanny/ui/screen/base_screen/controller/base_controller.dart';
import 'package:nannyvanny/ui/screen/home_screen/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BaseController baseController = Get.find<BaseController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        baseController.animationController.reverse();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      baseController.toggleAnimation();
                    },
                    child: Image.asset(
                      AppIcons.menuIcon,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 31,
                    backgroundColor: AppColor.textPinkColor,
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(AppIcons.dummyPhoto)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Emily Cyrus",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.textPinkColor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                      height: 150,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Nanny And\nBabysitting Services",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.blueTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.blueTextColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: AppColor.pinkColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -35,
                    bottom: -35,
                    right: -3,
                    child: Image.asset(
                      "assets/icons/woman.png",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Your Current Booking",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blueTextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder(
                builder: (HomeController homeController) {
                  return homeController.isLoading
                      ? SizedBox(
                          height: 100,
                          child: Center(child: getLoader()),
                        )
                      : homeController.bookingDataModel != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey.withOpacity(.2))
                                    ]),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                homeController
                                                    .bookingDataModel!
                                                    .currentBookings
                                                    .packageLabel,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppColor.textPinkColor,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const Spacer(),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: AppColor.textPinkColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 2),
                                                child: Text(
                                                  "Start",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            packageInfo(
                                                date: homeController
                                                    .bookingDataModel!
                                                    .currentBookings
                                                    .fromDate,
                                                title: "From",
                                                time: homeController
                                                    .bookingDataModel!
                                                    .currentBookings
                                                    .fromTime),
                                            packageInfo(
                                                date: homeController
                                                    .bookingDataModel!
                                                    .currentBookings
                                                    .toDate,
                                                title: "To",
                                                time: homeController
                                                    .bookingDataModel!
                                                    .currentBookings
                                                    .toTime),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            blueInfoButton(
                                                icon: const Icon(
                                                  Icons.star_border,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                title: "Rate Us"),
                                            blueInfoButton(
                                                icon: const Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                title: "Geolocation"),
                                            blueInfoButton(
                                                icon: Image.asset(
                                                    AppIcons.radioIcon,
                                                    height: 15,
                                                    width: 15),
                                                title: "Survillence"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 100,
                              child: Center(
                                child: Text("No data found!",
                                    style: TextStyle(
                                        color: AppColor.textPinkColor,
                                        fontSize: 17)),
                              ),
                            );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Packages",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blueTextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder(
                builder: (HomeController homeController) {
                  return homeController.isLoading
                      ? SizedBox(
                          height: 100,
                          child: Center(child: getLoader()),
                        )
                      : homeController.bookingDataModel != null
                          ? Column(
                              children: List.generate(
                                  homeController.bookingDataModel!.packages
                                      .length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25, bottom: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? AppColor.pinkColor
                                            : AppColor.skyBlueColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppIcons.calenderText,
                                                    height: 25,
                                                    width: 25,
                                                    color: index % 2 == 0
                                                        ? AppColor.textPinkColor
                                                        : Colors.white,
                                                  ),
                                                  calenderInfo(
                                                      homeController
                                                          .bookingDataModel!
                                                          .packages[index]
                                                          .packageName,
                                                      index),
                                                ],
                                              ),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: index % 2 == 0
                                                        ? AppColor.textPinkColor
                                                        : AppColor
                                                            .skyBlueButtonColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 2),
                                                  child: Text(
                                                    "Book Now",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                homeController
                                                    .bookingDataModel!
                                                    .packages[index]
                                                    .packageName,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        AppColor.blueTextColor),
                                              ),
                                              Spacer(),
                                              Text(
                                                "₹ ${homeController.bookingDataModel!.packages[index].price}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColor.blueTextColor),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homeController.bookingDataModel!
                                                .packages[index].description,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: index % 2 == 0
                                                    ? Colors.black
                                                    : Colors.white),
                                            maxLines: 3,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : const SizedBox(
                              height: 100,
                              child: Center(
                                child: Text("No data found!",
                                    style: TextStyle(
                                        color: AppColor.textPinkColor,
                                        fontSize: 17)),
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  blueInfoButton({required Widget icon, required String title}) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.blueTextColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  calenderInfo(String packagesName, int index) {
    if (packagesName == "One Day Package") {
      return text("01", index);
    } else if (packagesName == "Three Day Package") {
      return text("03", index);
    } else if (packagesName == "Five Day Package") {
      return text("05", index);
    } else {
      return Image.asset(
        "assets/icons/sun.png",
        height: 12,
        width: 12,
        color: index % 2 == 0 ? AppColor.textPinkColor : Colors.white,
      );
    }
  }

  text(String text, int index) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: index % 2 == 0 ? AppColor.textPinkColor : Colors.white,
      ),
    );
  }

  packageInfo(
      {required String title, required String date, required String time}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  AppIcons.calenderIcon,
                  height: 10,
                  width: 10,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  AppIcons.bookingsIcon,
                  color: AppColor.textPinkColor,
                  height: 10,
                  width: 10,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
