import '../../../ui/screen/base_screen/model/booking_data_model.dart';

abstract class UserRepository {
  Future<BookingDataModel> getData();
}
