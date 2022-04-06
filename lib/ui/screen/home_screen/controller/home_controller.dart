import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:nannyvanny/core/network/api_client.dart';
import 'package:nannyvanny/core/network/utils/error_utils.dart';
import 'package:nannyvanny/core/repository/user_repo/user_repository.dart';
import 'package:nannyvanny/ui/screen/base_screen/model/booking_data_model.dart';

class HomeController extends GetxController {
  final apiClient = GetIt.I.get<UserRepository>();

  BookingDataModel? bookingDataModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<void> getData() async {
    try {
      isLoading = true;
      final response = await apiClient.getData();
      isLoading = false;
      bookingDataModel = response;
    } on ApiError catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
