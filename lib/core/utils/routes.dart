import 'package:get/get.dart';
import 'package:nannyvanny/ui/screen/base_screen/base_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: BaseScreen.routeName, page: () => const BaseScreen()),
];
