import 'package:get_it/get_it.dart';
import 'package:nannyvanny/core/network/api_client.dart';
import 'package:nannyvanny/core/repository/user_repo/user_repository.dart';
import 'package:nannyvanny/ui/screen/base_screen/model/booking_data_model.dart';

class UserRepositoryImpl extends UserRepository {
  final apiClient = GetIt.I.get<ApiClient>();
  @override
  Future<BookingDataModel> getData() async {
    return await apiClient.getData();
  }
}
