import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:nannyvanny/core/constant/app_theme.dart';
import 'package:nannyvanny/core/utils/bindings.dart';
import 'package:nannyvanny/core/utils/routes.dart';
import 'package:nannyvanny/ui/screen/base_screen/base_screen.dart';
import 'package:nannyvanny/ui/screen/home_screen/home_screen.dart';

import 'core/network/api_client.dart';
import 'core/network/dio/dio_api_client.dart';
import 'core/repository/user_repo/user_repository.dart';
import 'core/repository/user_repo/user_repository_impl.dart';

void main() async {
  GetIt.I.registerSingletonAsync<ApiClient>(
    () => DioApiClient.getInstance(),
  );
  GetIt.I.registerSingletonWithDependencies<UserRepository>(
    () => UserRepositoryImpl(),
    dependsOn: [ApiClient],
  );
  await GetIt.I.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NannyVanny',
      theme: AppTheme.defTheme,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: BaseScreen.routeName,
      getPages: routes,
    );
  }
}
